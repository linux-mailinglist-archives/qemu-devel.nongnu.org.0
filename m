Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7EF661667
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 17:03:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEY7a-0007cg-Cw; Sun, 08 Jan 2023 11:02:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1pEY7W-0007bq-P1
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 11:02:03 -0500
Received: from sonic307-55.consmr.mail.gq1.yahoo.com ([98.137.64.31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1pEY7T-0007KG-6G
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 11:02:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1673193711; bh=j/7REqUdpZNLaRsnWjMV+rHTABevisAIlRn8Ne5heHo=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From:Subject:Reply-To;
 b=CK566PHrpi57mTF6dEykqonSl4NCcWgRHD0SxIjg8azrvsHyAGsLgNL48tylANTWNMqT27z/qefWR5yk5FlwV7a12VP5J3ohequZNOgRv3GZxF2TUuwpGHapyfzTaj9mbxvKu11l2VLv4IsgW/88Zb6S/SvSjRnrAsD0dr1SJJ81EAOg/FjYjfpI+4CCJLLcH+NjUGQEuWxCaGK5i+HzsYG0KX2feA8ZaC8dlovA1hvNqcbrhjaU2CbpWoLZdA+l91auWfKxKeTf+8n2hfYuP+dN2PRF+vDoqCdOxwIZJg+DyZGPNysZ7j5NftIoQPaksWtWclrHCMwIi9ueUqi21w==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1673193711; bh=mwmcsLfD1qcJX5LwxSSnbsMwmw6uNLxC/Ndv5pDi2iH=;
 h=X-Sonic-MF:Date:Subject:From:To:From:Subject;
 b=t9cdDfsqNdFXrSZuy4KeRJ7oMspGv1IMnpARwxS3tmjcjbc7NCPPckPpZxq//d6mGQ+yaN8Jvsli1TnQm4IffSnbbhwAO/lbQrO5lveAwl1m9ol1kZGPXXgVeUX5ERxI5JKxgNCzYTvAQvH1QAlveyMsngmpm9yVjC3NU//PusBPS5yGtQvbbEb5rvgDbxYKPn05jHhfw9dmQHqR1pazcXmn6y30AhOYHRiIEXLjcFyfW2VBH9QIxJJn/8OCYXp6VQHA8MmJ9PHqaixbFIjUoKY7PnyQgR65hpuaKw/5ioKspNDkZk1qiSNgEv7un6zLBOVzQTt4Q9zXafAqQK5YEg==
X-YMail-OSG: x9Gz0rUVM1lNIL_HEu9RrHIUXk4jsl6PSPnwtx.kmzvYoHOXSAjNMmto23elA2w
 TDtb22kmikRqJIJFY6hH96vw_AuwGnYbzsNjQI_3h6lJ.5GDFKIMIUNKCh2mdLTkvHd8tMLMnXMV
 SJYtETssrKviv8OJSAWOVd4MCmLEICYJ4VdIOXhBzChJwxjVKbljv6ggXsTJ.SXaqQQo85_FUBrO
 gZULtiCI7ULTNvh_NiRDUnubpwCIw2.isLQ8sFSH9NYd0OfiSjm_4pmcW9SCcEJVLzLst89A_dok
 R25xGJNiLMaKRGydtKFmjRbsBCgq2GE9y50hOUnNnZr2.TVBrdBI5y3HSfg2zwwoTwn4GPA4ynGP
 EKGk_n5Ep6BdUedGYgz4fwgYGbr59Szi7I1GKToR2fA2OKFYC39rCCp5mzk2HV8ZsNeeC36z6OCA
 SnD0Zz12__r9btmgO0L4hze5MFYG6BfN0x8eqbD_5HchMqSR8wE_UPGo9Pws_4CcpAslVzRlvpIK
 5HYtUfd.g5yJmf7iWQKu.cKimrM5nR34nAlE38DgR1zyQkTC9lGzcTCd_KdGQhdWQq.lmfyDc3s7
 l63F7FJdqukv5gn9zuzdtHCcRDJMOuujHEuZdirsyY1toZSiwDsHfbF0xPBK28ElafpTzDy7ojX8
 gZQ8MFrbZUxcS02ycp48T6.9bJNv9tR6Q4H8By5kGi3ldmQm5IcAww374SSduBlfl47HZgMnInyP
 R9fzkaYbR34KCjK5sSQLjIhFoWVkW9cZe_rc9Ipq532Bi5nk2E59vmP0HQLbX9y.KamIEOt1sD_d
 BK5zefbGvYPEriM65sbWJ0Ab8vKayzS2tiSbN2r_hLJXXyMN0G05GQWnzoTez.irKAz5Bn45dAY8
 QCCkHqCrvfxwm0WQRxJnhLX9ON2qARSkYuKf.ZMr0ClrioPTh_Aea6eZQD6VTMZALvPK3x8ZtYRL
 oJnwTWm5Mwz.PsLsedCZZM7L5DRq_U2FvrqBLRG.RmDMrNi2KsXLaTWZR4f.E_BbL2gCerX6nKgX
 SlA55qwFW0SQ4SsIbihXUOxn4XqvKTeUgI5wjMil_yKTcQiv0CmhZ2x1zF1Jwb3QQd7blPicH9oh
 iergd.UgHRIwHj0kvRxLl3Qzr6RkArcHKKkY2KapLHyIBsriGRzQrYkjAc91whiVZJHVs1mXaHul
 YwY1xxNm9Ro1mZt7fAMOCJ2Djkz7bkI.6S8GTmC_zb3Kygq3ikuJnvbnOUaoqWjXtp66a2P4piIG
 HPhQHCLhNM44RUNJoCWrIJfnMxqsFE1PLESV8OUjEdjgoy8EqMeETv6ER5hu4onIuQRIBiPtZf4P
 S0Np7j1GwGKXJH7B05UPqc4n1lH6cZ8mEQ7uFGvCXjgp48YmqTzC_7XJVFuHdPmngk9Xu4UlAOU9
 BNNg7K.FEd2r.8gPxiRYxRwPRQV.PYRYsUKOnY.c6elbAnWfRUlXAOGJIns3isuOYcEt5QhOqpf0
 uMYWyZy_o1jnTrIE8PEJmthNjxnxZ_qhacyo1j9isZQ3wCdOgxuVyIsniWulr3btMXXE0pOxenVu
 ir3d7ftco5Ho_FpRdnvEG4CVeXLS81DbCSYYbGJKAvJmSGLWbZ4Ba09EGUXSPqeekUi2C67XCBOs
 osZue6sQTE4aYYb5sV30i6XPveB_xXAXUWT9TEG6qpT8YCDFkNEDS_yP8R06KVb0N1GNv5TCozwW
 PZQUOeG3MzObYrKODEwBimRiUF._pkaJB84tlBlDsCj3t1.skRswlBiqO.YDWHmLCE7P1tRbAr2b
 .YibCfY0tq9j5HF2jQawxzo53M4Gy1OgifIH3RzP4asmqpkFTzOsVqv5VB5g2PSG0QwErlKy0Jyg
 f0QnIeSM1pRoZOSmJONNYrmQIhQa8.ep8BX.gwJJDSqOuvhq4cJiUTXkWmP1Mt3g36QmkS5NtQBg
 k2uvw7ED8aevoYi0vMR08mZOP4WERjem02oy0Vh4UnL4E6vJEndUqOoE67EFQhHgNzGthr1Su1tO
 q8kKYq4E1jzdPibGfattBdFBh.SQnUQZtwtsJwBfbgqtOXyzUHkuwS4M8Qk806sJyjcriefoBxrG
 9Do6xMAfMEPDHcZXHRdYP3lAEQCg_W2Dq0MD9n8S6PrKOhVGWDcIXNOXQ8Sx3IeH6EUod8xXjDsv
 ZhFyhsbg7Szkh2BgXB4cSX6DuMywv9g.h6F9Z0daqM9o5hx2oAc9RRSCdq_aviX.GuOeL9kbcNU4
 2rvCLBBA6cD8-
X-Sonic-MF: <brchuckz@aim.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic307.consmr.mail.gq1.yahoo.com with HTTP; Sun, 8 Jan 2023 16:01:51 +0000
Received: by hermes--production-ne1-7b69748c4d-dzr9v (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 472b6276cf2cc0deb61dd8cd01ce9286; 
 Sun, 08 Jan 2023 16:01:45 +0000 (UTC)
Message-ID: <2772822b-cbd3-ea25-2742-a4de195e8dbd@aol.com>
Date: Sun, 8 Jan 2023 11:01:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v6] xen/pt: reserve PCI slot 2 for Intel igd-passthru
From: Chuck Zmudzinski <brchuckz@aol.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org
References: <830263507e8f1a24a94f81909d5102c4b204e938.1672615492.git.brchuckz.ref@aol.com>
 <830263507e8f1a24a94f81909d5102c4b204e938.1672615492.git.brchuckz@aol.com>
 <Y7gqSLo8pMm4gfV+@perard.uk.xensource.com>
 <c39b9502-0020-ce54-abd8-b362430ba086@aol.com>
 <882652f8-ddda-a7d8-85b9-da46568036d3@aol.com>
 <6931ef9f-1978-97f5-2d32-003a9e64833c@aol.com>
Content-Language: en-US
In-Reply-To: <6931ef9f-1978-97f5-2d32-003a9e64833c@aol.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.20982
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
Received-SPF: pass client-ip=98.137.64.31; envelope-from=brchuckz@aim.com;
 helo=sonic307-55.consmr.mail.gq1.yahoo.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.107,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/6/2023 10:02 AM, Chuck Zmudzinski wrote:
> On 1/6/23 9:31 AM, Chuck Zmudzinski wrote:
> > On 1/6/23 9:10 AM, Chuck Zmudzinski wrote:
> >> On 1/6/23 9:03 AM, Anthony PERARD wrote:
> >>> On Sun, Jan 01, 2023 at 06:52:03PM -0500, Chuck Zmudzinski wrote:
> >>>> ...
> >>>> 
> >>>> Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
> >>> 
> >>> 
> >>> This patch looks good enough. It only changes the "xenfv" machine so it
> >>> doesn't prevent a proper fix to be done in the toolstack libxl.
> >>> 
> >>> The change in xen_pci_passthrough_class_init() to try to run some code
> >>> before pci_qdev_realize() could potentially break in the future due to
> >>> been uncommon but hopefully that will be ok.
> >>> 
> >>> So if no work to fix libxl appear soon, I'm ok with this patch:

I have a patch that fixes it in libxl. It still needs a few tweaks before it is
ready for submission, but I plan to do that soon, perhaps later today or
tomorrow at the latest.

> > 
> > Well, I can tell you and others who use qemu are more comfortable
> > fixing this in libxl, so hold off for a week or so. I should have
> > a patch to fix this in libxl written and tested by then. If for
> > some reason that does not work out, then we can fix it in qemu.
>
> One last thought: the only donwnside to fixing this in libxl is that
> other toolstacks that configure qemu to use the xenfv machine will not
> benefit from the fix in qemu that would simplify configuring the
> guest correctly for the igd. Other toolstacks would still need to
> override the default behavior of adding the xen platform device at
> slot 2. I think no matter what, we should at least patch qemu to have
> the xen-platform device use slot 3 instead of being automatically assigned
> to slot 2 when igd-passthru=on. The rest of the fix could then be
> implemented in libxl so that other pci devices such as emulated network
> devices, other passed through pci devices, etc., do not take slot 2 when
> gfx_passthru in xl.cfg is set.

I decided to write the patch to libxl to fix this presuming no
changes to qemu. I think dealing with the "qemu behaves
differently starting from version 8 problem" is more trouble
that it's worth, so I am OK with implementing the fix completely
in libxl, which means libxl will now use the "pc" machine type
when igd-passthru=on and xen_platform_pci is true, but my patch
to libxl will still use the "xenfv" machine when xen_platform_pci
is true and igd-passthru is disabled.

Cheers,

Chuck

