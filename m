Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C7F5BEEDF
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 23:01:26 +0200 (CEST)
Received: from localhost ([::1]:57168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oakMu-0006s5-U1
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 17:01:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oagb2-0007qR-5u
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 12:59:45 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:37813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oagb0-0006Cu-QG
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 12:59:43 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-3454b0b1b6dso34581357b3.4
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 09:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=IxKIzz77LNQLU/JSzs2i2Qmnswe3Lv4A94b567zBclE=;
 b=JhN5ZRDylhtbXJjt2WlyNGykNLNnqX8donGeTYC5uijZsU7TnoRemrw/T2p+lE9zpz
 pfi5uNrHFjOH/af6OVmLFgg4j9BFHpFDRtGeRgQQrVWYsyEjm2SEZZ6k2jhzhCiKXWky
 6rPuFMd2WUVHXuxavS1wIxIjcnre46d+Uv/eEaoinImkTFy1EgOEAFDrXfNGHjb5nToX
 xSSE8YVQjcX/z8U8SMeYg6CUhinLGuSwqrBrlKioNyxwdKBY33wLxdZ9qTdBrA9eI0Jw
 oXMpAYyRTV0old/NYTQ/EN0kNPpOjCXL78cNo7tnnjdXXNDveHJsLO6XRH4utDX8HXHe
 SsnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=IxKIzz77LNQLU/JSzs2i2Qmnswe3Lv4A94b567zBclE=;
 b=N0MirOTIIudxsHU/Mil9MSwSyH99cUF7gtmoAH7Ib9fa1bzzj4TjS/iiEMY717qKkT
 bnWDcpULYPNd8BXlfhuMVOpYiAfOyitugJYBrpVU1BE/ZouA+RF6+2yvYTY6SRd8glDt
 nmzSWZZOwbX90jXdmzVzSHWJgGhxaAV6c59ORnd9e8fF7XsQXtlh6B2/uDkbDdPvEGf5
 BfH0TGVwSqV2eon6Ce2fMa8OUriOe0aiMCw1PnO9tqj8vVWM4wAR65QpJyMmDnvh05Gd
 o/fnOEzVRTPSU1e15JbpD89d7232el8OCCAUnfZPo15sh9FihTjt8wx+yZd8qL5mFbfo
 EXwQ==
X-Gm-Message-State: ACrzQf2ECKnVg2qp3coWgpCU9QNwK6vhqA1vRDZFarskz6ZQ6HW3rfVz
 dIV7vpTiSnPqEHQ/EX0Zas7Lx5IMRmEQjvaufMafQQmMjQdjVi1g
X-Google-Smtp-Source: AMsMyM4YXqLoxjnREOR6GzRqmZzVJcXjRg0rBSwJch1kbPulG4PAM6+T2Xblf2w8d9WXaUhCIH/y9mqmQlB2kFA+mJg=
X-Received: by 2002:a0d:df46:0:b0:345:22d9:f5c1 with SMTP id
 i67-20020a0ddf46000000b0034522d9f5c1mr19767187ywe.239.1663693181157; Tue, 20
 Sep 2022 09:59:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220913165945.1635016-1-stefanb@linux.ibm.com>
In-Reply-To: <20220913165945.1635016-1-stefanb@linux.ibm.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 20 Sep 2022 12:59:29 -0400
Message-ID: <CAJSP0QWJbmZhwKjcbBj+7gKG-ZEqshmhddHCH2gHr67R8t+Z=w@mail.gmail.com>
Subject: Re: [PULL 0/4] Merge tpm 2022/09/13 v1
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for
any user-visible changes.

