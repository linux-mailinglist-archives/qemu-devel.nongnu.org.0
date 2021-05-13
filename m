Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF24C37F5D0
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 12:46:25 +0200 (CEST)
Received: from localhost ([::1]:39438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh8rI-0005zx-U0
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 06:46:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lh8oJ-0003sO-DC
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:43:19 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:33372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lh8oH-0000Th-N2
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:43:19 -0400
Received: by mail-wr1-x435.google.com with SMTP id n2so26521728wrm.0
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 03:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=nBceKyoVMbB7CVlqiC1fxke6hUIUphDHhuKLVzzXedY=;
 b=RT4bKBSW82WHCBE/Kb0qYWUqu/z8/yRq6N2mUsBxixlJKsqNqXkWbiwrCWsvI+ySii
 HNHmVHntAl8Hi9mcSIsm7cvgYKqi9e3k17vgPLm3UQ8bR5s9ZIEjY2dZ3lMxT6Z+SzqB
 pSKwZvItWqBQ/jt4mMJ/zZdrFgP1TsllvXvDRY+8BFKyDmyWgH32JiTq7lVUBPbRUfed
 Eil95vKukDcdP0WR/MpicCGO6SXYPDiCp88/WBP7PZwXC2K2O8+ZjPEY8SQTIREsJAIT
 km0buemx067OBlRi3tHS5XsWDWqAE2BMUdZy8OpurKWTucgBn6btaGgd2YrkLqVkF4tL
 W3sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=nBceKyoVMbB7CVlqiC1fxke6hUIUphDHhuKLVzzXedY=;
 b=Yz4/UDpbo1iV53ce10W+otZbci4ebxcYwYsYRTH/92xQAcs6TKqRftiS5SEqkt67jC
 drx0U42ygs2I/N+nn4YCn5qTY0LGJ5Gh+BFVRLCFdaG/PbRZialIDdhynQjhxIGsyvxA
 PAWam0d93b5FASNaARI21OWccneb2Wl0PE+Wt/kOaBNNLKcn1fjIMoapgDbUAiUHepar
 9ArmS636uhUj5kjsnm5pyfjzQTOIWYBg2YvwqIrggKDnBW5MTFoOqz3N95iUzVlKWvgz
 IZaJKJlwvXv6Ms9Q4CWqNyxOecWJ974ek2f9GbhBmbZaYpvS272ZJYBeTq2mceuit+wW
 M+NQ==
X-Gm-Message-State: AOAM533emOPB/P9Mni9r1TmLJqMx12dqn8ffxWVqrp1qhdAyLV+NhMOt
 vlUjwR7Q8DYmzKZi91Luv8ZCAg==
X-Google-Smtp-Source: ABdhPJyuQdk+yMJrNzP5z7CYBmgN1me7V0mVlAm5+lHhAYWoYGWJjD96F7nEvNTht3HQn8sloZTZBA==
X-Received: by 2002:a05:6000:1887:: with SMTP id
 a7mr49932443wri.280.1620902592937; 
 Thu, 13 May 2021 03:43:12 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 16sm1951906wmi.13.2021.05.13.03.43.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 03:43:11 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 31CFD1FF7E;
 Thu, 13 May 2021 11:43:11 +0100 (BST)
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-38-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 37/72] softfloat: Move muladd_floats to
 softfloat-parts.c.inc
Date: Thu, 13 May 2021 11:43:03 +0100
In-reply-to: <20210508014802.892561-38-richard.henderson@linaro.org>
Message-ID: <87cztuewxs.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Rename to parts$N_muladd.
> Implement float128_muladd with FloatParts128.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

