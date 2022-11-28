Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EC663ACF2
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 16:49:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozgN6-0000Ca-MZ; Mon, 28 Nov 2022 10:48:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ozgN1-0000BS-It
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 10:48:38 -0500
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ozgMz-0004I4-I8
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 10:48:35 -0500
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-3b56782b3f6so109308047b3.13
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 07:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2svme5ZC8Asqgx3UdRPD1prJmU9owYoZpN3OALbIYDA=;
 b=LXv6hugiGQEcJtZwcF4iS4z3UEnaP0XtDUyTKfopKA21wccxuDeYQnIoaGk9DmCTF4
 NPvO2XiRA/EeYUpNgyFWQN6iKb7Gj/AQ+NsO5mI3Jn01Jl+W3AYDoDsHus9zIytDt7Eu
 civ3MThLFHKbD28jOboih4QdsQmG2qH5M6a9lRqJsAF2dFbM2NZotcwW/R9PCE8LdZJs
 UliOCfJaV7djkzRcvM+6C/Pu4/Fs7bA5pb71aQyKHMAXsN/o7+u1LZkvpmOGnykvwKAa
 bJTyl7ZmzJyvyRuC5LAIw4QsqhooOuNy5IbYjq04GuoHtddLICU45O0PCaGP04N9zqaR
 Q9cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2svme5ZC8Asqgx3UdRPD1prJmU9owYoZpN3OALbIYDA=;
 b=Jedvl6KtlcunH00oXfwJCuBVssUiA4XdzqjM5lNHKKDsaKr7MVDMwzkXMeTLsZ8NN1
 dtrF4E6BHJeurNfFG60Tzo665PkTdz9cvIfU8u9jpQx1pwxhlOR2V45dGNkiEfpnJHbh
 aB5waEQGDMZ2HAW6ChpaMIA+7KVMeqLUqMD+5EQmNn2UMlSpog6Zla7ci2VqPXFWD7EJ
 HG7h3Pycwslq7OU32KVu2iwNtHzKlce6jlC/hYFeMqUrVEfyBI8LvPmD5k+9yYfSeQd6
 o+MVTFhvb9jddBjnbPSiKa012mJddTbBJyvj8+Whs7gSusurtjpPyVErwb5ePowNsCzc
 5RAA==
X-Gm-Message-State: ANoB5pnK/OuR7l0SKvQJEt8tv2zyXy20n9QcJnOwQPQmi01V1KkvebbZ
 fgCRYZuZOd4ubGnM1UUo20OFfc9vM4RSlZD9+VY=
X-Google-Smtp-Source: AA0mqf4IStMlwMZDuq4VyOjHqCr/e0H09tQ46X3F3/IcijjnfxF3Pf8t6jhDwh4QhTOj2nBOvWdmknnfyj7hQbsHw+Y=
X-Received: by 2002:a0d:cc4a:0:b0:3bc:183c:f1eb with SMTP id
 o71-20020a0dcc4a000000b003bc183cf1ebmr14752101ywd.156.1669650512099; Mon, 28
 Nov 2022 07:48:32 -0800 (PST)
MIME-Version: 1.0
References: <20221128134832.84867-1-philmd@linaro.org>
 <20221128134832.84867-5-philmd@linaro.org>
 <CAJSP0QUNU1CEJ8AMmo=tDC60ChY=Qo67nOEBBZmtaYeXvOybFQ@mail.gmail.com>
 <68346f84-d9f0-c232-dcaf-d614c3261c4e@linaro.org>
 <CAJSP0QXt7ZpYnYhA64ByUdqH9fi=ywVmRmkm-SDnf8FwKL2MQQ@mail.gmail.com>
 <45ef70c4-1b6b-2d05-5781-9a639911b716@linaro.org>
In-Reply-To: <45ef70c4-1b6b-2d05-5781-9a639911b716@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 28 Nov 2022 10:48:20 -0500
Message-ID: <CAJSP0QWdHn1QtYc6yNY43R7D6dNyQrhb+DjYMOj=3AT9xtpvxA@mail.gmail.com>
Subject: Re: [RFC PATCH-for-7.2 4/5] hw/display/qxl: Avoid buffer overrun in
 qxl_phys2virt (CVE-2022-4144)
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 qemu-devel@nongnu.org, Alexander Bulekov <alxndr@bu.edu>, 
 Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>, 
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 28 Nov 2022 at 10:46, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 28/11/22 16:32, Stefan Hajnoczi wrote:
> > On Mon, 28 Nov 2022 at 10:25, Philippe Mathieu-Daud=C3=A9 <philmd@linar=
o.org> wrote:
> >>
> >> On 28/11/22 16:16, Stefan Hajnoczi wrote:
> >>> On Mon, 28 Nov 2022 at 08:53, Philippe Mathieu-Daud=C3=A9 <philmd@lin=
aro.org> wrote:
> >>>>
> >>>> Have qxl_get_check_slot_offset() return false if the requested
> >>>> buffer size does not fit within the slot memory region.
> >>>>
> >>>> Similarly qxl_phys2virt() now returns NULL in such case, and
> >>>> qxl_dirty_one_surface() aborts.
> >>>>
> >>>> This avoids buffer overrun in the host pointer returned by
> >>>> memory_region_get_ram_ptr().
> >>>>
> >>>> Fixes: CVE-2022-4144 (out-of-bounds read)
> >>>> Reported-by: Wenxu Yin (@awxylitol)
> >>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1336
> >>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> >>>> ---
> >>>>    hw/display/qxl.c | 22 ++++++++++++++++++----
> >>>>    hw/display/qxl.h |  2 +-
> >>>>    2 files changed, 19 insertions(+), 5 deletions(-)
> >>>>
> >>>> diff --git a/hw/display/qxl.c b/hw/display/qxl.c
> >>>> index 231d733250..afa157d327 100644
> >>>> --- a/hw/display/qxl.c
> >>>> +++ b/hw/display/qxl.c
> >>>> @@ -1424,11 +1424,13 @@ static void qxl_reset_surfaces(PCIQXLDevice =
*d)
> >>>>
> >>>>    /* can be also called from spice server thread context */
> >>>>    static bool qxl_get_check_slot_offset(PCIQXLDevice *qxl, QXLPHYSI=
CAL pqxl,
> >>>> -                                      uint32_t *s, uint64_t *o)
> >>>> +                                      uint32_t *s, uint64_t *o,
> >>>> +                                      size_t size_requested)
> >>>>    {
> >>>>        uint64_t phys   =3D le64_to_cpu(pqxl);
> >>>>        uint32_t slot   =3D (phys >> (64 -  8)) & 0xff;
> >>>>        uint64_t offset =3D phys & 0xffffffffffff;
> >>>> +    uint64_t size_available;
> >>>>
> >>>>        if (slot >=3D NUM_MEMSLOTS) {
> >>>>            qxl_set_guest_bug(qxl, "slot too large %d >=3D %d", slot,
> >>>> @@ -1453,6 +1455,18 @@ static bool qxl_get_check_slot_offset(PCIQXLD=
evice *qxl, QXLPHYSICAL pqxl,
> >>>>            return false;
> >>>>        }
> >>>>
> >>>> +    size_available =3D memory_region_size(qxl->guest_slots[slot].mr=
);
> >>>> +    assert(qxl->guest_slots[slot].offset + offset < size_available)=
;
> >>>
> >>> Can this assertion be triggered by the guest (via an invalid pqxl
> >>> value)? I think the answer is no, but I don't know the the qxl code
> >>> well enough to be sure.
> >>
> >> 'qxl->guest_slots[slot].offset' is initialized in qxl_add_memslot()
> >> (host); 'size_available' also comes from the host, but 'offset'
> >> comes from the guest via 'QXLPHYSICAL pqxl' IIUC.
> >>
> >> I added this check to avoid overflow, but it can be changed to return
> >> an error.
> >
> > Yes, please.
>
> Or I could use Int128 to do arithmetic, but various other places do it
> this way without checking overflow with memory_region_size(). Such API
> change should be global and is out of the scope of this CVE fix IMO.
>
> > Aside from concerns about -DNDEBUG, which builds without assertions,
>
> This isn't an issue anymore since 262a69f428 ("osdep.h: Prohibit
> disabling assert() in supported builds").

I didn't know about that. Thanks!

Stefan

