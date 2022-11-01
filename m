Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E750614C8B
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 15:27:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opreH-0004QD-Pi; Tue, 01 Nov 2022 09:49:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1opreA-0004Og-KB
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 09:49:45 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1opre8-0000mP-PN
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 09:49:42 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id j130so17341810ybj.9
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 06:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=45dErmjS6eB7RgWLHLkVVh0U+DKPHytoMRQCdtP2AII=;
 b=ZLkS+x1OuqArYNMHJBgAOmJTQzvsaUMsdvGirVCtIii6qfFWDAf3qhEGRtudRZSyWT
 zlXLN+P+cx9vqrRnrfTRhWTngJfyRCEkZDz5InHzNFY4uP9d9frdAyIAkdIUbTy18fO/
 qoWUZ0NUIiS/cUwR9paBGy2aYJwqJr4OGGwnKixzZucXb/jmED17FwemzhMNrYr1l0Av
 Wv7OkRzmg6l0LdCVIqnOh4JeI+bF/IdU1CM0Y1B80uePW4fzp48t1lFxYIIr1I4rK6Jl
 aPEYMDeA+pLJpENByfA52SAKUgsypZxG8aFqyqyc+YXoPDPjHpHUCF0PL12hT3KQqqOH
 7whw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=45dErmjS6eB7RgWLHLkVVh0U+DKPHytoMRQCdtP2AII=;
 b=NzwxSfEV6Bi42gN6UJkIGetAT9Oo1NknoiSQ68l0FC9NYmG1/uVIH8VrlMshgLcdc9
 SuDlG+UJwo4GsGn78PSrGn+JDh09MKw6Ogx7Zw5rqz7DKPzfTwnxwY3p4JH0UIEsL2fx
 gOdwVKvl63jMU0nyjhQQ7DlV13e4C+YHBvWNshMp4HH7wChvtJQTT37cCQGLxe120Lbk
 JceyTSQQKCuXv8wKgUn1VRF8HmPRZ31LI/K5mmD2BoWPG8xUVofOpYIK48Jriax64aD4
 5zS6MZGwKZKFoPmjsl758OHVBmu4I89QU4xwpm54TjwZWjPQZZCSOHbKWuA1RrdkqE9I
 t0wg==
X-Gm-Message-State: ACrzQf0o7rWBH/oUq7gkS6fGTa5bHhTFLypXSrXyML2Bi+XpAcMJE8SP
 2ESL4DoVs6uQzlhGQZafnL0zfRIrVpUGDtgRXio=
X-Google-Smtp-Source: AMsMyM59DXkknqCfRPnzSr+KkjLL9YN9kgtxHJ870jM63vUq6VHyidDH9ugIG9KZNR9F8oYRdvNVFLI4rsaRjstBHXU=
X-Received: by 2002:a05:6902:191:b0:6cd:3a43:cda3 with SMTP id
 t17-20020a056902019100b006cd3a43cda3mr5028158ybh.207.1667310579674; Tue, 01
 Nov 2022 06:49:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAJSP0QXz+7Yvde1-N4OjQQ+Vo95UsQoOONmRXQsBg8wEJFaC3g@mail.gmail.com>
 <20221101134800.2725965-1-imammedo@redhat.com>
In-Reply-To: <20221101134800.2725965-1-imammedo@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 1 Nov 2022 09:49:27 -0400
Message-ID: <CAJSP0QVjZr_E2ftvNpsBZE7Phqipt5VUO6h5HN+B2PcP=vvUnA@mail.gmail.com>
Subject: Re: [PATCH] fixup! bios-tables-test: add test for number of cores >
 255
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

I will wait for Michael's v2 pull request in the coming days.

Stefan

