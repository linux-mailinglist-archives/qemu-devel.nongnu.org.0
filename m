Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 622F5440DD7
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Oct 2021 11:31:22 +0100 (CET)
Received: from localhost ([::1]:35010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mh87V-0004x6-F3
	for lists+qemu-devel@lfdr.de; Sun, 31 Oct 2021 06:31:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mh86O-0004FN-Uc
 for qemu-devel@nongnu.org; Sun, 31 Oct 2021 06:30:13 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:40609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mh86M-0007ep-Lk
 for qemu-devel@nongnu.org; Sun, 31 Oct 2021 06:30:12 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 j128-20020a1c2386000000b003301a98dd62so6772419wmj.5
 for <qemu-devel@nongnu.org>; Sun, 31 Oct 2021 03:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=s+0egWjy0NBU61d39YvBQzUMTEiL7FWwA4VBn5sXE/w=;
 b=BAU6yq8RlGlANrkmWZc2P9Ya3C62Lhi8UV7pqHTi+jDZKaV6Ipf1kGdvgWsNY9JrK/
 IjrFTZ0vF4PRsUX6Qm20feKMRRmn+dS0NyXPfFJ8cbHSWNft1eX4lCe4RKcgQ660fydh
 NlIlKZ5oc3MVbqKGr1riXPQCqA+udAsTBWFlsjKYShlfKn40aTaNnaRYiMNSyzkDiGfS
 NMxyJ6YoStDmHX60geE1xcFfWQ1knq91lJvH7EjHPG9F8E0bnRmZRFeRoQeT2aF1DGJR
 DNHs5cZAU/Y6ZveQov1pWea5vueJdqPjS9ZZ4lhEOEmd1Ffo+0qYFgVZdovvGSBsGLZR
 oDbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=s+0egWjy0NBU61d39YvBQzUMTEiL7FWwA4VBn5sXE/w=;
 b=U9BWEFhGovo9jPVP1iUiHJFle/I1r70HVzku7NA3dFygJeWoGV6xhxmm03GzxCUgFu
 l0bJLJ+9bZUHTExyOrYAiwY1evDUJZ6+KMO/w+0bsA4oVAUgSmUDvdc2Ec9tELc0n6+r
 G8jObD8kSZV6O1iOpwnI1RG3Hw1EjLFzkdCX7JXyy2E6TW762+i+rPaWuxBsD6t5e/dt
 /CGyv9lSXw9IlcTUZwHTmWiGKsYBQfxlqOA+vklyFw1gOLkc4pJl/+omqMezBrvZ5siX
 mtw48WgN+jG/UNsGnXoaG06CdNio7DMpmPuTAHiAZ7ujiA/u3cIcrdj2YemxtXkSkMOv
 4U4Q==
X-Gm-Message-State: AOAM532FAduLwMRLQJEjBcTshdxJiU4MxEJ0qbSJsVPKKnthX1Ne7aom
 JA0kiG2URwuDnGyg49h23I0=
X-Google-Smtp-Source: ABdhPJyHmEIg+Gt+NMtc+nt/dNDkn2PaeeDKLl4Wt7qlnIr3hX1oVb6lysXqsZqjcq4LxT+plFtGww==
X-Received: by 2002:a05:600c:2f17:: with SMTP id
 r23mr6756417wmn.93.1635676209212; 
 Sun, 31 Oct 2021 03:30:09 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id w10sm10527611wrq.88.2021.10.31.03.30.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Oct 2021 03:30:08 -0700 (PDT)
Message-ID: <802858e6-1d20-be0b-d29e-b4bfc966767c@amsat.org>
Date: Sun, 31 Oct 2021 11:30:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 00/66] user-only: Cleanup SIGSEGV and SIGBUS handling
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211030171635.1689530-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.426,
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

On 10/30/21 19:15, Richard Henderson wrote:
> Changes for v6:
>   Rebase and apply some patch review (phil)
> 
> Changes for v5:
>   I've combined the sigsegv and sigbus patch sets, because they're
>   so very closely modelled.  We've got user-only hooks named
> 
>     record_sigsegv
>     record_sigbus
> 
>   While the tlb_fill hook becomes sysemu only, the corresponding
>   do_unaligned_access hook was always sysemu only and stays that way.
> 
>   The actual tcg backend patches to enable proper delivery of the
>   unaligned accesses have been delayed until another patch set, as
>   this is quite large enough -- I'm mostly restricting this to the
>   user-only interface (though there are some extra patches that are
>   included to make sure things build properly).
> 
> Patches lacking review:
>   21-target-alpha-Implement-alpha_cpu_record_sigsegv.patch
>   26-target-hppa-Make-hppa_cpu_tlb_fill-sysemu-only.patch
>   29-target-microblaze-Make-mb_cpu_tlb_fill-sysemu-onl.patch
>   32-linux-user-openrisc-Abort-for-EXCP_RANGE-EXCP_FPE.patch
>   36-target-s390x-Use-probe_access_flags-in-s390_probe.patch
>   38-target-sh4-Make-sh4_cpu_tlb_fill-sysemu-only.patch
>   46-linux-user-hppa-Remove-EXCP_UNALIGN-handling.patch
>   51-linux-user-ppc-Remove-POWERPC_EXCP_ALIGN-handling.patch

I could look at these, but unfortunately don't have enough time
for the rest. Would it help to merge the 60 first patches for
this release and delay the prctl() ones for the next dev window?

>   61-linux-user-Split-out-do_prctl-and-subroutines.patch
>   62-linux-user-Disable-more-prctl-subcodes.patch
>   64-target-alpha-Implement-prctl_unalign_sigbus.patch
>   65-target-hppa-Implement-prctl_unalign_sigbus.patch
>   66-target-sh4-Implement-prctl_unalign_sigbus.patch

