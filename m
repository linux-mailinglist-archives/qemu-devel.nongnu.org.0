Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49656619590
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 12:45:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqv6z-0000Jw-Eb; Fri, 04 Nov 2022 07:43:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oqv6x-0000Iw-RV
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 07:43:47 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oqv6w-0000wc-2B
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 07:43:47 -0400
Received: by mail-pl1-x62a.google.com with SMTP id d20so3568978plr.10
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 04:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2cbGWn9NdUuWCs26mj3asm8NMohzdvg8Sydr0LytHy8=;
 b=G8pK61r/8FqsfTQKrVhAjlMk2vSD+RQTQaDyuR2DywX2W4QKLWiQIGIpGVj4wwdRZ/
 32vHXdOr198UAqw7gDR/kKRV7ILVAc3HvR3dK5r0FJ2TF/FWRIYZjWwxfa3zeu+ZDNSa
 nfiz32MIpJZW5RMGMo9BU2ystG+ScDy21fxuuMVReAI0O3H7X+sN6pGqJMdr2ke5JCsh
 Liv8ke97yKDVeZvwYtNrOrUWXWTleEXvyb2djF55DaDEQX6HVoSvx97jjwtZb+WepNL2
 jywsJYzvp7Q5GeXiwTD5tnzS0W1nHhmusBAt/a1ayq/ESfyFdcdfUB4pd25ZZpl/zM7U
 f/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2cbGWn9NdUuWCs26mj3asm8NMohzdvg8Sydr0LytHy8=;
 b=4ODO1+iMQQ3bT6NCHeKNXiTeTpNMioelE0k0wQCiQOy7vM7yj7ETx+/L9lmJ0fUYe0
 Ugb0XSVvPnLNfMhCvgTBgIFjPT6pyftDBQNKo+z13B914XBj3X2UWsx/WRzEjG7ZvQmA
 aV2tKonqIfMplHP5HsEOKEiR4RxC1JVGfXNISrc6GkcQGS4Ou6pJBTwu8gEX7PPNnDK+
 WNdfSJdN6OazrpVMev2pZADx+oC/sQdG+s1aco657N8eKGAL8CO9zaI2lpDKxNtuX/eI
 ampk/GucEVDN4XovoIwOu3R8OUIoNDUnz8LMkIjmLFSPeRhgxKKREhNmkmsxQK3JC6TH
 0Iyw==
X-Gm-Message-State: ACrzQf3fmZB8FkCpv3PC0Y3Zb9ZIC3XCSZpdZNCVoJ2wwgmUyYPVxYKt
 YnV5lFw5dFikh1+Z2TVGOngy1ueGqP+WtnqmgumnLg==
X-Google-Smtp-Source: AMsMyM49nrexT3aVl/uvIrJS99RwL4V43jNBxz1Z59wC0LgjUN5eDy9Y8/FTRyhNdDL7WvHBrb+ZTaw3+IwbXOx4m8I=
X-Received: by 2002:a17:903:4d7:b0:178:8564:f754 with SMTP id
 jm23-20020a17090304d700b001788564f754mr35213271plb.60.1667562224527; Fri, 04
 Nov 2022 04:43:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220929093035.4231-1-cfontana@suse.de>
 <3568bac0-1b64-d096-b78a-29f628a70448@suse.de>
 <b68f4730-be61-b635-057e-270f3f74f63b@suse.de> <Y1rPI2sXcxjbVIbd@redhat.com>
 <b3af1867-008c-779a-a53a-5d11721aa4e8@suse.de>
In-Reply-To: <b3af1867-008c-779a-a53a-5d11721aa4e8@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Nov 2022 11:43:32 +0000
Message-ID: <CAFEAcA8CVVCZhtnAdLrUjBiRevf+QYMW2f8sV-euV0rm5wX+Pw@mail.gmail.com>
Subject: Re: [PATCH v9 0/5] improve error handling for module load
To: Claudio Fontana <cfontana@suse.de>
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org, 
 dinechin@redhat.com, Gerd Hoffmann <kraxel@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 4 Nov 2022 at 09:05, Claudio Fontana <cfontana@suse.de> wrote:
>
> On 10/27/22 20:34, Kevin Wolf wrote:
> > Am 27.10.2022 um 16:52 hat Claudio Fontana geschrieben:
> >> A ping on this one, is there anything more that needs to be urgently
> >> addressed before it can be queued for inclusion?  This is currently
> >> creating problems for upstream kubevirt, due to the error handling not
> >> properly reporting permissions errors on module file access.
> >
> > What is the right tree to take this one?
> >
> > get_maintainers.pl doesn't show anything for module.[ch], which might be
> > why nobody feels responsible for merging this.
> >
> > Kevin
>
> Ping,
>
> there is no util/* catch-all, so indeed it seems an unmaintained section of QEMU,
> Richard and Markus took an interest to review the patches,
>
> but it seems that the project needs a maintainer / queue for the util/module.[ch]..
>
> Peter could you help with this?

I asked on IRC, and Paolo said he'd take this series.

thanks
-- PMM

