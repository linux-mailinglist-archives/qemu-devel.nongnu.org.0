Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEEE3ABD8D
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 22:36:55 +0200 (CEST)
Received: from localhost ([::1]:56976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltykw-0000gr-NN
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 16:36:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ltyjq-0007Jc-5V
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 16:35:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1ltyjj-0006Dv-M1
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 16:35:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623962137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=58ESMm71n+LLCPSPJrivoljEEgowoqW0JMt5wEsO6fg=;
 b=Heeqopqz8XrvbpW3hrCvXNIiATNVNfweDYZNUwFV4W4TxR09nMJ66zzpkFlH2ywC7VKDt1
 xfxRDe9KSiREWLhz046RA4ZYGulP4reADo/bN7Jv4DpXJtjzhQ166RjW8b4rtAzp5estfw
 2k7cf3Mpoqk9Aj9HfPGCsVpPwR2TWPY=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-VYSqTZaqPwCVuATB5WOWdA-1; Thu, 17 Jun 2021 16:35:36 -0400
X-MC-Unique: VYSqTZaqPwCVuATB5WOWdA-1
Received: by mail-lf1-f70.google.com with SMTP id
 bu14-20020a056512168eb029031226594940so3078226lfb.15
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 13:35:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=58ESMm71n+LLCPSPJrivoljEEgowoqW0JMt5wEsO6fg=;
 b=jWmLISFl3B73tYAFPjUJ9tn61vXbp4Tbk2pmCJSzN7GbsyXgCDTqo3z6Ep3CnOConk
 i72Gcq9pt2/ulBemjfqM2SPgU4zx9lCKq3Sof0lrbyYi93hOEs4FPVO0tTdaYVyGe71/
 0Oh9eI7P9CKJUp/7WTwvNB6v1g8gfcKRBm6mmknSd5vewR38LnThhsZa2KLZDLB/2IET
 do38snyEhcV9GB5Cvhqulg2eC0VBqTmyJbXWRVSPc88mp/WvScGJj73pSDqKuStf60uh
 ixsvM80FgRvpopH7YGKuo0ndOAp3cz5HtSGxWNuljt5s1XuAi2/7h6Umf5EOjFGZxhyi
 hOdg==
X-Gm-Message-State: AOAM530WfT0Mm0nk5uveZZKeONmVFPNIko/jhdljgS9ACfG0DxwtPDFN
 HEqusBjSpD7GhVlW8mgwBjC+De9Q6+gR6vnLAZ0nQcNw9/2qYemIUwLNp/1cQS1i/RAZfleZk45
 pkhRJ+/SU9huDhEJ/avHX5dd54S+4Z84=
X-Received: by 2002:a2e:b711:: with SMTP id j17mr6224549ljo.329.1623962135020; 
 Thu, 17 Jun 2021 13:35:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1fotvXEab2mNuTc3Plxir+HmE7JbeJ9BHiOwSr+u4asRrY5ZZPLEFIgMIqrEUaZRkiAwjVHkcZQeNJMbne5I=
X-Received: by 2002:a2e:b711:: with SMTP id j17mr6224507ljo.329.1623962134717; 
 Thu, 17 Jun 2021 13:35:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210525065931.1628554-1-dovmurik@linux.ibm.com>
 <20210615152033.czhsaz44yxtc5ext@habkost.net>
 <1cff8347-ee38-a0a8-f089-36b28a40b828@redhat.com>
 <06b28ac7-19ed-edd8-a555-2858e976d964@linux.ibm.com>
 <20210617172213.j2c3o7h76zrsw2yt@habkost.net>
 <918371b8-f8d0-30c2-c0bb-812027e4cafb@linux.ibm.com>
In-Reply-To: <918371b8-f8d0-30c2-c0bb-812027e4cafb@linux.ibm.com>
From: Eduardo Habkost <ehabkost@redhat.com>
Date: Thu, 17 Jun 2021 16:35:18 -0400
Message-ID: <CAOpTY_q2nQbbvXbShh-TqVCa_AVt4mJw5JhHJE2tZQKHJ8T6Fg@mail.gmail.com>
Subject: Re: [PATCH] x86: add SEV hashing to fw_cfg for kernel/initrd/cmdline
To: Dov Murik <dovmurik@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 James Bottomley <jejb@linux.ibm.com>, Tobin Feldman-Fitzthum <tobin@ibm.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Laszlo Ersek <lersek@redhat.com>, Hubertus Franke <frankeh@us.ibm.com>,
 Jim Cadden <jcadden@ibm.com>, Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 17, 2021 at 3:17 PM Dov Murik <dovmurik@linux.ibm.com> wrote:
>
>
>
> On 17/06/2021 20:22, Eduardo Habkost wrote:
> > On Thu, Jun 17, 2021 at 03:48:52PM +0300, Dov Murik wrote:
> >>
> >>
> >> On 15/06/2021 22:53, Philippe Mathieu-Daud=C3=A9 wrote:
> >>> Hi Dov, James,
> >>>
> >>> +Connor who asked to be reviewer.
> >>>
> >>> On 6/15/21 5:20 PM, Eduardo Habkost wrote:
> >>>> On Tue, May 25, 2021 at 06:59:31AM +0000, Dov Murik wrote:
> >>>>> From: James Bottomley <jejb@linux.ibm.com>
> >>>>>
> >>>>> If the VM is using memory encryption and also specifies a kernel/in=
itrd
> >>>>> or appended command line, calculate the hashes and add them to the
> >>>>> encrypted data.  For this to work, OVMF must support an encrypted a=
rea
> >>>>> to place the data which is advertised via a special GUID in the OVM=
F
> >>>>> reset table (if the GUID doesn't exist, the user isn't allowed to p=
ass
> >>>>> in the kernel/initrd/cmdline via the fw_cfg interface).
> >>>>>
> >>>>> The hashes of each of the files is calculated (or the string in the=
 case
> >>>>> of the cmdline with trailing '\0' included).  Each entry in the has=
hes
> >>>>> table is GUID identified and since they're passed through the memcr=
ypt
> >>>>> interface, the hash of the encrypted data will be accumulated by th=
e
> >>>>> PSP.
> >>>>>
> >>>>> Signed-off-by: James Bottomley <jejb@linux.ibm.com>
> >>>>> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
> >>>>> [dovmurik@linux.ibm.com: use machine->cgs, remove parsing of GUID
> >>>>> strings, remove GCC pragma, fix checkpatch errors]
> >>>>> ---
> >>>>>
> >>>>> OVMF support for handling the table of hashes (verifying that the
> >>>>> kernel/initrd/cmdline passed via the fw_cfg interface indeed corres=
pond
> >>>>> to the measured hashes in the table) will be posted soon to edk2-de=
vel.
> >>>>>
> >>>>> ---
> >>>>>  hw/i386/x86.c | 120 ++++++++++++++++++++++++++++++++++++++++++++++=
+++-
> >>>>>  1 file changed, 119 insertions(+), 1 deletion(-)
> >>>>>
> >>>>
> >>>> This is not an objection to the patch itself, but: can we do
> >>>> something to move all sev-related code to sev.c?  It would make
> >>>> the process of assigning a maintainer and reviewing/merging
> >>>> future patches much simpler.
> >>>>
> >>>> I am not familiar with SEV internals, so my only question is
> >>>> about configurations where SEV is disabled:
> >>>>
> >>>> [...]
> >>>>> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> >>>>> @@ -778,6 +818,11 @@ void x86_load_linux(X86MachineState *x86ms,
> >>>>>      const char *initrd_filename =3D machine->initrd_filename;
> >>>>>      const char *dtb_filename =3D machine->dtb;
> >>>>>      const char *kernel_cmdline =3D machine->kernel_cmdline;
> >>>>> +    uint8_t buf[HASH_SIZE];
> >>>>> +    uint8_t *hash =3D buf;
> >>>>> +    size_t hash_len =3D sizeof(buf);
> >>>>> +    struct sev_hash_table *sev_ht =3D NULL;
> >>>>> +    int sev_ht_index =3D 0;
> >>>
> >>> Can you move all these variable into a structure, and use it as a
> >>> SEV loader context?
> >>>
> >>> Then each block of code you added can be moved to its own function,
> >>> self-described, working with the previous context.
> >>>
> >>> The functions can be declared in sev_i386.h and defined in sev.c as
> >>> Eduardo suggested.
> >>>
> >>
> >> Thanks Philippe, I'll try this approach.
> >>
> >>
> >> I assume you mean that an addition like this:
> >>
> >> +    if (sev_ht) {
> >> +        struct sev_hash_table_entry *e =3D &sev_ht->entries[sev_ht_in=
dex++];
> >> +
> >> +        qcrypto_hash_bytes(QCRYPTO_HASH_ALG_SHA256, (char *)kernel_cm=
dline,
> >> +                           strlen(kernel_cmdline) + 1,
> >> +                           &hash, &hash_len, &error_fatal);
> >> +        memcpy(e->hash, hash, hash_len);
> >> +        e->len =3D sizeof(*e);
> >> +        memcpy(e->guid, sev_cmdline_entry_guid, sizeof(e->guid));
> >> +    }
> >>
> >> will be extracted to a function, and here (in x86_load_linux()) replac=
ed
> >> with a single call:
> >>
> >>     sev_kernel_loader_calc_cmdline_hash(&sev_loader_context, kernel_cm=
dline);
> >>
> >> and that function will have an empty stub in non-SEV builds, and a do-
> >> nothing condition (at the beginning) if it's an SEV-disabled VM, and
> >> will do the actual work in SEV VMs.
> >>
> >> Right?
> >
> > I would suggest a generic notification mechanism instead, where
> > SEV code could register to be notified after the kernel/initrd is
> > loaded.
> >
> > Maybe the existing qemu_add_machine_init_done_notifier()
> > mechanism would be enough for this?  Is there a reason the hash
> > calculation needs to be done inside x86_load_linux(),
> > specifically?
> >
>
> SEV already registers that callback - sev_machine_done_notify, which
> calls sev_launch_get_measure.  We want the hashes page filled and
> encrypted *before* that measurement is taken by the PSP.  We can squeeze
> in the hashes and page encryption before the measurement *if* we can
> calculate the hashes at this point.
>
> x86_load_linux already deals with kernel/initrd/cmdline, so that was the
> easiest place to add the hash calculation.
>
> It's also a bit weird (semantically) to modify the guest RAM after
> pc_memory_init has finished.

Understood.

>
>
> We can add a new notifier towards the end of x86_load_linux, but can we
> avoid passing all the different pointers+sizes of kernel/initrd/cmdline
> to that notifier?  Do you envision other uses for registering on that eve=
nt?

I expect other confidential guest technologies to do something very
similar, but I don't want to make you overengineer this. The generic
mechanism was just a suggestion.

Extracting the code to a single SEV-specific function would already be
an improvement. That would make the code easier to refactor if we
decide we need a generic mechanism in the future.

--=20
Eduardo


