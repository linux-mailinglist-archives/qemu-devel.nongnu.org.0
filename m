Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E6C30F4B2
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 15:14:04 +0100 (CET)
Received: from localhost ([::1]:35124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7fOW-0001lf-1d
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 09:14:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l7fJI-0005wf-T3; Thu, 04 Feb 2021 09:08:41 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:42062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l7fJF-0003IU-93; Thu, 04 Feb 2021 09:08:39 -0500
Received: by mail-ej1-x632.google.com with SMTP id r12so5455545ejb.9;
 Thu, 04 Feb 2021 06:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MNjZ2T24Pz/dCc+dv4Qe6k97MwL95d8V62OVF+xgWJ0=;
 b=OR7I1b0OFDke9Cs6b113r7+GjSrGyRdnKRvd+C9WjgDj8mc7fdztcPjpzKQPwlGZeE
 Vu96p9pC2L8FvmKXMxsIcIoGY2udb10fwhj64QvM/iabVde/sCzv7iQ76jmfcLlzKiG+
 6iRUzc2a2aP3ztnqNHSNqg2bDcI4Xqh9KAwzi7fZXGAVztGD3LQBMCQbNlgYuwt8x+eA
 ClSTZX6dUbLeg8xKrrGm5qLPSfTiXgYVjNG98SEQ189g4CT/DRsNUTLQGoru5D/hLjmj
 gq7NTrzfr91OngLW581Y22C4n5L/Gf8RXoC9MnugvXXrRZO8c8xAAKx3kzK15EtWI73W
 iE2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MNjZ2T24Pz/dCc+dv4Qe6k97MwL95d8V62OVF+xgWJ0=;
 b=QVokWhO2tmJ1vcgesTpAe5koK37LZJEklqLxh4pNyJtOSRwJfTyH3WoYz3Z8N/vvXE
 /5LdBurAeH02//x7sCAXpyszhiv7GlbkPG3M9V9KkfrbTbz0zTZqr1w34zZP11v7AU78
 Qc6sMZs72zQH61IAdpErr1OwOR821UfEg3atpkZr6G913CkRX+AHl/EFB7CqnAe44uTR
 m5ky7OPzSJDG/D7OH6k6nEwo9H+iGT7Br+uwIkYlSJcjtSUmoLumTNptgL4yL/nCZzH+
 Pa4prr5N04uXbOI46zTB8t+/LSqe01BxOQTsQ65ewdHWOZOEI5rTvYuusmi3b9394qhK
 Mv9w==
X-Gm-Message-State: AOAM533IGIgXfLALNDx1oqpkLVGZUVTqVDhw4ieNbTi8Is7doijPoC4J
 B2h5rqsPTThTP0OX7GsfYj4=
X-Google-Smtp-Source: ABdhPJxBwFLng/2xzfDZ1TGKYMX8lc7Ldyvnm6eNBfLX/mRBu4+GZD37JuDV3gpcKJWl0ByCxTPAEg==
X-Received: by 2002:a17:906:914a:: with SMTP id
 y10mr1563387ejw.33.1612447714644; 
 Thu, 04 Feb 2021 06:08:34 -0800 (PST)
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id h3sm1790664ejl.111.2021.02.04.06.08.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 06:08:33 -0800 (PST)
Subject: Re: [PATCH 0/3] Acceptance tests for mpc8544ds & virtex-ml507 ppc
 machines
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20210112164045.98565-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <351b6495-55c2-81f7-7bbc-67f065114f1c@amsat.org>
Date: Thu, 4 Feb 2021 15:08:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210112164045.98565-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.182,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/12/21 5:40 PM, Thomas Huth wrote:
> Let's use the two new images from the QEMU advent calendar 2020 to test
> the mpc8544ds & virtex-ml507 ppc machines.
> 
> Thomas Huth (3):
>   tests/acceptance: Move the pseries test to a separate file
>   tests/acceptance: Test the mpc8544ds machine
>   tests/acceptance: Add a test for the virtex-ml507 ppc machine
> 
>  MAINTAINERS                            |  1 +
>  tests/acceptance/boot_linux_console.py | 19 -------
>  tests/acceptance/machine_ppc.py        | 69 ++++++++++++++++++++++++++
>  3 files changed, 70 insertions(+), 19 deletions(-)
>  create mode 100644 tests/acceptance/machine_ppc.py

Thanks, series applied to my acceptance-testing tree.

