Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1FC5FEBBE
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 11:35:51 +0200 (CEST)
Received: from localhost ([::1]:50934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojH6c-0008NA-Ln
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 05:35:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ojH2N-0005Fb-K9
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 05:31:27 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ojH2L-0007Ze-3S
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 05:31:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WeoMKWHtgBVg9RrM6ePYwkIGRgJHdEiIKAaNg1fD/s8=; b=GsI9dKrT5K7hBCkzTOFozVnC26
 teoKn8+h7ugr23Uo9zn2skTleL2bIJ5RCx0+CdkkpEronQWKPsH+LIxpuJuMh/TWZcjh/MFTaFWy1
 apu+mHKF3Znv3uu9dGir0gzXGhRXb91uSRd79zMnD3vAfAIDxhGcumrHAsDcDHoRxs+KBHimF5TN9
 EL7e/Su2SsCf0K5ncqTblLUpOAfl6HL2MZdmOOqGwDKbdW+avWu52wSpvmmMPJusFfjZC/2OpNDM/
 RP6NXwnpeTIGXaPIHYsi9jLuj3gPQW32mSAzYUDTAaLSAtAcsY0I6Mam47osKlnhMFB6XdY5ITb9m
 71/srCO9VsE6Zh4QZ+cquWuzcxCxIVhUltsHB0oxUX09Fmt1TsprMvLDGW1Z7e1z5eyMupmagHywN
 Yj+QMwM9TPbq8HwYrX8yFpuSna3uVYsFPJv0cnWPnTX5z/CrksL9Syz85jskSn7fCpklnA8wmRzzS
 LLri56L/zDYbecfENmc4mzptx/wd1NygNtjM4N/58SMUOlj7iPwSZW9tjUlik7g0OkrcS349DJy7V
 G+UXkCvvglJp6FcGnchnk0NKkdq9jS/dKb808yCI8aVjwjlPIOJusnpfd35jqfAYY2jIuf2PKjBx2
 uWTSlsv1DbmF82AZBuUAyTjOjAoiw6XT65C7ENonw=;
Received: from [2a00:23c4:8ba8:7100:6571:576d:97b8:647b]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ojH0V-0001ep-67; Fri, 14 Oct 2022 10:29:35 +0100
Message-ID: <5c82da29-43e4-c8f2-5cae-400358adb6a9@ilande.co.uk>
Date: Fri, 14 Oct 2022 10:31:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, stefanha@redhat.com, peter.maydell@linaro.org,
 agraf@csgraf.de
References: <20221012121152.1179051-1-alex.bennee@linaro.org>
 <20221012121152.1179051-4-alex.bennee@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20221012121152.1179051-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba8:7100:6571:576d:97b8:647b
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC PATCH 3/4] docs/devel: simplify the minimal checklist
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.25,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12/10/2022 13:11, Alex Bennée wrote:

> The bullet points are quite long and contain process tips. Move those
> bits of the bullet to the relevant sections and link to them. Use a
> table for nicer formatting of the checklist.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   docs/devel/submitting-a-patch.rst | 75 ++++++++++++++++++++-----------
>   roms/qboot                        |  2 +-
>   2 files changed, 50 insertions(+), 27 deletions(-)
> 
> diff --git a/docs/devel/submitting-a-patch.rst b/docs/devel/submitting-a-patch.rst
> index fb1673e974..41771501bf 100644
> --- a/docs/devel/submitting-a-patch.rst
> +++ b/docs/devel/submitting-a-patch.rst
> @@ -12,25 +12,18 @@ be committed faster.
>   This page seems very long, so if you are only trying to post a quick
>   one-shot fix, the bare minimum we ask is that:
>   
> --  You **must** provide a Signed-off-by: line (this is a hard
> -   requirement because it's how you say "I'm legally okay to contribute
> -   this and happy for it to go into QEMU", modeled after the `Linux kernel
> -   <http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/SubmittingPatches?id=f6f94e2ab1b33f0082ac22d71f66385a60d8157f#n297>`__
> -   policy.) ``git commit -s`` or ``git format-patch -s`` will add one.
> --  All contributions to QEMU must be **sent as patches** to the
> -   qemu-devel `mailing list <https://wiki.qemu.org/Contribute/MailingLists>`__.
> -   Patch contributions should not be posted on the bug tracker, posted on
> -   forums, or externally hosted and linked to. (We have other mailing lists too,
> -   but all patches must go to qemu-devel, possibly with a Cc: to another
> -   list.) ``git send-email`` (`step-by-step setup
> -   guide <https://git-send-email.io/>`__ and `hints and
> -   tips <https://elixir.bootlin.com/linux/latest/source/Documentation/process/email-clients.rst>`__)
> -   works best for delivering the patch without mangling it, but
> -   attachments can be used as a last resort on a first-time submission.
> --  You must read replies to your message, and be willing to act on them.
> -   Note, however, that maintainers are often willing to manually fix up
> -   first-time contributions, since there is a learning curve involved in
> -   making an ideal patch submission.
> +.. list-table:: Minimal Checklist for Patches
> +   :widths: 35 65
> +   :header-rows: 1
> +
> +   * - Check
> +     - Reason
> +   * - Patches contain Signed-off-by: Author Name <author@email>
> +     - States you are legally able to contribute the code. See :ref:`patch_emails_must_include_a_signed_off_by_line`
> +   * - Sent as patch emails to ``qemu-devel@nongnu.org``
> +     - The project uses an email list based workflow. See :ref:`submitting_your_patches`
> +   * - Be prepared to respond to review comments
> +     - Code that doesn't pass review will not get merged. See :ref:`participating_in_code_review`
>   
>   You do not have to subscribe to post (list policy is to reply-to-all to
>   preserve CCs and keep non-subscribers in the loop on the threads they
> @@ -229,6 +222,19 @@ bisection doesn't land on a known-broken state.
>   Submitting your Patches
>   -----------------------
>   
> +The QEMU project uses a public email based workflow for reviewing and
> +merging patches. As a result all contributions to QEMU must be **sent
> +as patches** to the qemu-devel `mailing list
> +<https://wiki.qemu.org/Contribute/MailingLists>`__. Patch
> +contributions should not be posted on the bug tracker, posted on
> +forums, or externally hosted and linked to. (We have other mailing
> +lists too, but all patches must go to qemu-devel, possibly with a Cc:
> +to another list.) ``git send-email`` (`step-by-step setup guide
> +<https://git-send-email.io/>`__ and `hints and tips
> +<https://elixir.bootlin.com/linux/latest/source/Documentation/process/email-clients.rst>`__)
> +works best for delivering the patch without mangling it, but
> +attachments can be used as a last resort on a first-time submission.
> +
>   .. _if_you_cannot_send_patch_emails:
>   
>   If you cannot send patch emails
> @@ -314,10 +320,12 @@ git repository to fetch the original commit.
>   Patch emails must include a ``Signed-off-by:`` line
>   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   
> -For more information see `SubmittingPatches 1.12
> -<http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/SubmittingPatches?id=f6f94e2ab1b33f0082ac22d71f66385a60d8157f#n297>`__.
> -This is vital or we will not be able to apply your patch! Please use
> -your real name to sign a patch (not an alias or acronym).

I think it is worth keeping that part about using a real name rather than an 
alias/acronym - perhaps that could be included in the Minimal Checklist table above?

> +Your patches **must** include a Signed-off-by: line. This is a hard
> +requirement because it's how you say "I'm legally okay to contribute
> +this and happy for it to go into QEMU". The process is modelled after
> +the `Linux kernel
> +<http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/SubmittingPatches?id=f6f94e2ab1b33f0082ac22d71f66385a60d8157f#n297>`__
> +policy.
>   
>   If you wrote the patch, make sure your "From:" and "Signed-off-by:"
>   lines use the same spelling. It's okay if you subscribe or contribute to
> @@ -327,6 +335,11 @@ include a "From:" line in the body of the email (different from your
>   envelope From:) that will give credit to the correct author; but again,
>   that author's Signed-off-by: line is mandatory, with the same spelling.
>   
> +There are various tooling options for automatically adding these tags
> +include using ``git commit -s`` or ``git format-patch -s``. For more
> +information see `SubmittingPatches 1.12
> +<http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/SubmittingPatches?id=f6f94e2ab1b33f0082ac22d71f66385a60d8157f#n297>`__.
> +
>   .. _include_a_meaningful_cover_letter:
>   
>   Include a meaningful cover letter
> @@ -397,9 +410,19 @@ Participating in Code Review
>   ----------------------------
>   
>   All patches submitted to the QEMU project go through a code review
> -process before they are accepted. Some areas of code that are well
> -maintained may review patches quickly, lesser-loved areas of code may
> -have a longer delay.
> +process before they are accepted. This will often mean a series will
> +go through a number of iterations before being picked up by
> +:ref:`maintainers<maintainers>`. You therefor should be prepared to
> +read replies to your messages and be willing to act on them.
> +
> +Maintainers are often willing to manually fix up first-time
> +contributions, since there is a learning curve involved in making an
> +ideal patch submission. However for the best results you should
> +proactively respond to suggestions with changes or justifications for
> +your current approach.
> +
> +Some areas of code that are well maintained may review patches
> +quickly, lesser-loved areas of code may have a longer delay.
>   
>   .. _stay_around_to_fix_problems_raised_in_code_review:
>   
> diff --git a/roms/qboot b/roms/qboot
> index 8ca302e86d..a5300c4949 160000
> --- a/roms/qboot
> +++ b/roms/qboot
> @@ -1 +1 @@
> -Subproject commit 8ca302e86d685fa05b16e2b208888243da319941
> +Subproject commit a5300c4949b8d4de2d34bedfaed66793f48ec948


ATB,

Mark.

