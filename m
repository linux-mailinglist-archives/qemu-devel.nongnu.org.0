Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD07F5FEB9D
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 11:29:09 +0200 (CEST)
Received: from localhost ([::1]:56116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojH09-0004pD-0k
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 05:29:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ojGxj-00027X-0a
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 05:26:39 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ojGxd-0006hr-QO
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 05:26:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IaQYV7ndXuv04mmy1/caFcHCqQVNfqyum8pblKNJUJw=; b=ABoAEOZPNijnfPDz/m75GN2oXM
 2APs/SemS0lW8Y6OrUKmHOdx0PvFhjAnBGRwNAra/imimGSw7A8GQ/C5DvpELnv1aFN6isv3lwaT8
 Nisqj6ZDJOcyUhamOPlRCtSIHNGaA+aTpxhYsF5kLoKYZyCdSY3/JfpnXy7jShzfq69ZzruEtTaPa
 MnOTbHR6Y/xW6FOfyM3IZRVcWqNXMLhQHA3ZwuI3b2IiNmdGquPxPHtDDlH3OqPin/T2fbDMAX4Rz
 BEtdyVsPZGJyENQF1+wBvQ8z51iEWDeIP25LLrGFPXLDrfjipHOhJmBuvKdudmxWj2qmb6NLwONNi
 saPeeCshm9VLda6cO9zQTy2bPwrZ8UORM3SpbmdJjkKL/pv4P7eHnOKH/K8WlRR2t3HtfcJfu7CKT
 1oB4v/kyQzfmmwxr0G4cVUXVnDVBqV2xD/fXaday6D/zNARqQvWzHazmCwblF6De7WWiA9nZbSK6i
 AuKsmNWBYkJ0AFZmsuo5fQY+VT9m2Cw/W6k/K7M1714DIXpFux33NhtPROmwIsc9ulQpbwfljwue6
 zB9pR5KURv4BVZC67P7RG3/hfkYbc1i7q5x0ogxpBbDkh0BrLFIJMzqWfoWGX+V6dhgMXzvXoNx7y
 B1dhjkNM4TcigomPIGnoaqQVQh5/awc+y/HLez1/8=;
Received: from [2a00:23c4:8ba8:7100:6571:576d:97b8:647b]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ojGvm-0001c1-ST; Fri, 14 Oct 2022 10:24:43 +0100
Message-ID: <222c561c-4771-c3ae-6749-5c0f4ea4c6ef@ilande.co.uk>
Date: Fri, 14 Oct 2022 10:26:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, stefanha@redhat.com, peter.maydell@linaro.org,
 agraf@csgraf.de
References: <20221012121152.1179051-1-alex.bennee@linaro.org>
 <20221012121152.1179051-2-alex.bennee@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20221012121152.1179051-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba8:7100:6571:576d:97b8:647b
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC PATCH 1/4] docs/devel: add a maintainers section to
 development process
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

> We don't currently have a clear place in the documentation to describe
> the rolls and responsibilities of a maintainer. Lets create one so we
> can. I've moved a few small bits out of other files to try and keep
> everything in one place.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   docs/devel/code-of-conduct.rst           |  2 +
>   docs/devel/index-process.rst             |  1 +
>   docs/devel/maintainers.rst               | 84 ++++++++++++++++++++++++
>   docs/devel/submitting-a-pull-request.rst | 12 ++--
>   4 files changed, 91 insertions(+), 8 deletions(-)
>   create mode 100644 docs/devel/maintainers.rst
> 
> diff --git a/docs/devel/code-of-conduct.rst b/docs/devel/code-of-conduct.rst
> index 195444d1b4..f734ed0317 100644
> --- a/docs/devel/code-of-conduct.rst
> +++ b/docs/devel/code-of-conduct.rst
> @@ -1,3 +1,5 @@
> +.. _code_of_conduct:
> +
>   Code of Conduct
>   ===============
>   
> diff --git a/docs/devel/index-process.rst b/docs/devel/index-process.rst
> index d0d7a200fd..d50dd74c3e 100644
> --- a/docs/devel/index-process.rst
> +++ b/docs/devel/index-process.rst
> @@ -8,6 +8,7 @@ Notes about how to interact with the community and how and where to submit patch
>   
>      code-of-conduct
>      conflict-resolution
> +   maintainers
>      style
>      submitting-a-patch
>      trivial-patches
> diff --git a/docs/devel/maintainers.rst b/docs/devel/maintainers.rst
> new file mode 100644
> index 0000000000..e3c7003bfa
> --- /dev/null
> +++ b/docs/devel/maintainers.rst
> @@ -0,0 +1,84 @@
> +.. _maintainers:
> +
> +The Roll of Maintainers
> +=======================
> +
> +Maintainers are a critical part of the projects contributor ecosystem.
> +They come from a wide range of backgrounds from unpaid hobbyists
> +working in their spare time to employees who work on the project as
> +part of their job. Maintainer activities include:
> +
> +  - reviewing patches and suggesting changes
> +  - preparing pull requests for their subsystems
> +  - participating other project activities

missing word: participating in other project activities

> +They are also human and subject to the same pressures as everyone else
> +including overload and burn out. Like everyone else they are subject
> +to projects :ref:`code_of_conduct`.
> +
> +The MAINTAINERS file
> +--------------------
> +
> +The `MAINTAINERS
> +<https://gitlab.com/qemu-project/qemu/-/blob/master/MAINTAINERS>`__
> +file contains the canonical list of who is a maintainer. The file
> +is machine readable so an appropriately configured git (see
> +:ref:`cc_the_relevant_maintainer`) can automatically Cc them on
> +patches that touch their area of code.
> +
> +The file also describes the status of the area of code to give an idea
> +of how actively that section is maintained.
> +
> +.. list-table:: Meaning of support status in MAINTAINERS
> +   :widths: 25 75
> +   :header-rows: 1
> +
> +   * - Status
> +     - Meaning
> +   * - Supported
> +     - Someone is actually paid to look after this.
> +   * - Maintained
> +     - Someone actually looks after it.
> +   * - Odd Fixes
> +     - It has a maintainer but they don't have time to do
> +       much other than throw the odd patch in.
> +   * - Orphan
> +     - No current maintainer.
> +   * - Obsolete
> +     - Old obsolete code, should use something else.
> +
> +Please bare in mind that even if someone is paid to support something

s/bare/bear/

> +it does not mean they are paid to support you. This is open source and
> +the code comes with no warranty and the project makes no guarantees
> +about dealing with bugs or features requests.
> +
> +Becoming a maintainer
> +---------------------
> +
> +Maintainers are volunteers who put themselves forward to keep an eye
> +on an area of code. They are generally accepted by the community to
> +have a good understanding of the subsystem and able to make a positive
> +contribution to the project.

Is it worth making this a bit stronger such as "having a demonstrable track record of 
providing accepted upstream patches"? I'm not sure if this is being a bit too 
nit-picky, however someone could have good understanding of a subsystem such as PCI 
but be still unfamiliar with the QEMU's PCI APIs and how they should be used.

> +The process is simple - simply sent a patch to the list that updates
> +the ``MAINTAINERS`` file. Sometimes this is done as part of a larger
> +series when a new sub-system is being added to the code base. This can
> +also be done by a retiring maintainer who nominates their replacement
> +after discussion with other contributors.

Should we also request that a patch adding to MAINTAINERS needs an R-B tag from an 
existing maintainer?

> +Once the patch is reviewed and merged the only other step is to make
> +sure your GPG key is signed.
> +
> +.. _maintainer_keys:
> +
> +Maintainer GPG Keys
> +~~~~~~~~~~~~~~~~~~~
> +
> +GPG is used to sign pull requests so they can be identified as really
> +coming from the maintainer. If your key is not already signed by
> +members of the QEMU community, you should make arrangements to attend
> +a `KeySigningParty <https://wiki.qemu.org/KeySigningParty>`__ (for
> +example at KVM Forum) or make alternative arrangements to have your
> +key signed by an attendee. Key signing requires meeting another
> +community member **in person** so please make appropriate
> +arrangements.
> diff --git a/docs/devel/submitting-a-pull-request.rst b/docs/devel/submitting-a-pull-request.rst
> index c9d1e8afd9..a4cd7ebbb6 100644
> --- a/docs/devel/submitting-a-pull-request.rst
> +++ b/docs/devel/submitting-a-pull-request.rst
> @@ -53,14 +53,10 @@ series) and that "make check" passes before sending out the pull
>   request. As a submaintainer you're one of QEMU's lines of defense
>   against bad code, so double check the details.
>   
> -**All pull requests must be signed**. If your key is not already signed
> -by members of the QEMU community, you should make arrangements to attend
> -a `KeySigningParty <https://wiki.qemu.org/KeySigningParty>`__ (for
> -example at KVM Forum) or make alternative arrangements to have your key
> -signed by an attendee.  Key signing requires meeting another community
> -member \*in person\* so please make appropriate arrangements.  By
> -"signed" here we mean that the pullreq email should quote a tag which is
> -a GPG-signed tag (as created with 'gpg tag -s ...').
> +**All pull requests must be signed**. By "signed" here we mean that
> +the pullreq email should quote a tag which is a GPG-signed tag (as
> +created with 'gpg tag -s ...'). See :ref:`maintainer_keys` for
> +details.
>   
>   **Pull requests not for master should say "not for master" and have
>   "PULL SUBSYSTEM whatever" in the subject tag**. If your pull request is


ATB,

Mark.

