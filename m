Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBDA3B4F59
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 17:57:54 +0200 (CEST)
Received: from localhost ([::1]:36652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxAgr-0004AB-Eq
	for lists+qemu-devel@lfdr.de; Sat, 26 Jun 2021 11:57:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1lxAg4-0003Lt-Lo; Sat, 26 Jun 2021 11:57:04 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:45006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1lxAg2-0005fX-JV; Sat, 26 Jun 2021 11:57:04 -0400
Received: by mail-io1-xd2e.google.com with SMTP id h2so16283905iob.11;
 Sat, 26 Jun 2021 08:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8CRlZzxyPs3NmkzCeNJ+FGKiVCSK0QA0w58UggZURbk=;
 b=n0iy9IIkCBzEeT6C+QJnePiumF5LIE0m3O08xbhAd67AB8RWLiosYpvJLEc4sZRSUn
 54g/1u/bPyLn/iHRtyScDYuX1MmHx05B/jtJ5kw1SD0rCtoKAEtAU9GW8OmlkPQohDvF
 m/hA9Kj4FJYsM43ulexZLzDuKX2jaDxB2+AuXGNOdnVFTNcWOHJg24o4Zh76enSEEIaZ
 xmYoVE9b+INoVC+Edk3/jSRG+fU9X+a62Pu2vcdFMrGfBETBw0yeXvRHNr7R2Yt7KODZ
 LookBDvHyo1NsySyfKHLgL9udSWZj1pBAjAh++ivLJu39rHiKODAMdPyQTp2gK49SE5+
 8Ong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8CRlZzxyPs3NmkzCeNJ+FGKiVCSK0QA0w58UggZURbk=;
 b=aC56tyOvlqEJ/mwPEev0V9VMb94qV/Sv0nyA234jiA53a7llIBHknagj8rcc13Ss9H
 7f766h2JGvVnPo6dWnoYNUGg0xPtn7flWUza0jjwEsVOSRJW4FakcSrVf6Zv+dLMwdeV
 TszQq4HjqZs3lz9QHte+fdITnx9DXp66pc9xxDY3nz0sbH+b08b+tBaMLQevj11+eEjS
 QQzQBtwsMHZS8ilf7G1I+UjRCsp/HTfa2gN9GGHXOTey2rwW5/trXpxAgjVoUITJHjkM
 BJAJ7sDWJEbkY7M4z23AqL5J2746CM0QuZUMUpRGJq4N8GutkLn9/AX08dwJOVjU13bJ
 ajwQ==
X-Gm-Message-State: AOAM533TTP3MU5zkY2j09YbeUwt8fmMWG8cwg9+bYI5woObYc/v5eVSI
 yQs7ry7lCm2b4iYopkkarparxJdGiZ6OG0mg10k=
X-Google-Smtp-Source: ABdhPJzQ6pDbZSb/4O59WwP/+aghrfy0y13Lkvc3XlmAvm+0XmbRsEeDuWqGcOmRlfvNl6709maMNq0M1K2FA7ovL60=
X-Received: by 2002:a6b:4418:: with SMTP id r24mr13066158ioa.123.1624723021160; 
 Sat, 26 Jun 2021 08:57:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210519142359.23083-1-pl@kamp.de>
 <20210519142359.23083-6-pl@kamp.de>
 <CAOi1vP8AFWaS7Qwu8DVQP0EGZh48CcsrYnTfCWU2J6ZctGA2EQ@mail.gmail.com>
 <99aaf586-5555-8c45-08c8-e50e3b5919de@kamp.de>
 <CAOi1vP8PAMttja8vWvxkWX-Wn4co5tu6kORKXSHGbwTMzFzMdA@mail.gmail.com>
 <52b6dbf5-897a-c862-bde2-5e8c0424e8db@kamp.de>
In-Reply-To: <52b6dbf5-897a-c862-bde2-5e8c0424e8db@kamp.de>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Sat, 26 Jun 2021 17:56:45 +0200
Message-ID: <CAOi1vP8Hp8zHuG0_xB7g8X1sBPAw=oZ4np65--UqBavB4YAXAQ@mail.gmail.com>
Subject: Re: [PATCH V3 5/6] block/rbd: add write zeroes support
To: Peter Lieven <pl@kamp.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=idryomov@gmail.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: kwolf@redhat.com,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, ct@flyingcircus.io,
 Paolo Bonzini <pbonzini@redhat.com>, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 21, 2021 at 10:49 AM Peter Lieven <pl@kamp.de> wrote:
>
> Am 18.06.21 um 12:34 schrieb Ilya Dryomov:
> > On Fri, Jun 18, 2021 at 11:00 AM Peter Lieven <pl@kamp.de> wrote:
> >> Am 16.06.21 um 14:34 schrieb Ilya Dryomov:
> >>> On Wed, May 19, 2021 at 4:28 PM Peter Lieven <pl@kamp.de> wrote:
> >>>> Signed-off-by: Peter Lieven <pl@kamp.de>
> >>>> ---
> >>>>   block/rbd.c | 37 ++++++++++++++++++++++++++++++++++++-
> >>>>   1 file changed, 36 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/block/rbd.c b/block/rbd.c
> >>>> index 0d8612a988..ee13f08a74 100644
> >>>> --- a/block/rbd.c
> >>>> +++ b/block/rbd.c
> >>>> @@ -63,7 +63,8 @@ typedef enum {
> >>>>       RBD_AIO_READ,
> >>>>       RBD_AIO_WRITE,
> >>>>       RBD_AIO_DISCARD,
> >>>> -    RBD_AIO_FLUSH
> >>>> +    RBD_AIO_FLUSH,
> >>>> +    RBD_AIO_WRITE_ZEROES
> >>>>   } RBDAIOCmd;
> >>>>
> >>>>   typedef struct BDRVRBDState {
> >>>> @@ -705,6 +706,10 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
> >>>>           }
> >>>>       }
> >>>>
> >>>> +#ifdef LIBRBD_SUPPORTS_WRITE_ZEROES
> >>>> +    bs->supported_zero_flags = BDRV_REQ_MAY_UNMAP;
> >>> I wonder if we should also set BDRV_REQ_NO_FALLBACK here since librbd
> >>> does not really have a notion of non-efficient explicit zeroing.
> >>
> >> This is only true if thick provisioning is supported which is in Octopus onwards, right?
> > Since Pacific, I think.
> >
> >> So it would only be correct to set this if thick provisioning is supported otherwise we could
> >>
> >> fail with ENOTSUP and then qemu emulates the zeroing with plain writes.
> > I actually had a question about that.  Why are you returning ENOTSUP
> > in case BDRV_REQ_MAY_UNMAP is not specified and that can't be fulfilled
> > because librbd is too old for RBD_WRITE_ZEROES_FLAG_THICK_PROVISION?
> >
> > My understanding has always been that BDRV_REQ_MAY_UNMAP is just
> > a hint.  Deallocating if BDRV_REQ_MAY_UNMAP is specified is not nice
> > but should be perfectly acceptable.  It is certainly better than
> > returning ENOTSUP, particularly if ENOTSUP causes Qemu to do plain
> > zeroing.
>
>
> I think this was introduced to support different provisioning modes. If BDRV_REQ_MAY_UNMAP is not set
>
> the caller of bdrv_write_zeroes expects that the driver does thick provisioning. If the driver cannot handle that (efficiently)
>
> qemu does a plain zero write.
>
>
> I am still not fully understanding the meaning of the BDRV_REQ_NO_FALLBACK flag. The original commit states that it was introduced for qemu-img to efficiently
>
> zero out the target and avoid the slow fallback. When I last worked on qemu-img convert I remember that there was a call to zero out the target if bdrv_has_zero_init
>
> is not 1. It seems hat meanwhile a target_is_zero cmdline switch for qemu-img convert was added to let the user assert that a preexisting target is zero.
>
> Maybe someone can help here if it would be right to set BDRV_REQ_NO_FALLBACK for rbd in either of the 2 cases (thick provisioning is support or not)?

Since no one spoke up I think we should

a) remove the BDRV_REQ_MAY_UNMAP check in qemu_rbd_co_pwrite_zeroes()
   and as a consequence always unmap if librbd is too old

   It's not clear what qemu's expectation is but in general Write
   Zeroes is allowed to unmap.  The only guarantee is that subsequent
   reads return zeroes, everything else is a hint.  This is how it is
   specified in the kernel and in the NVMe spec.

   In particular, block/nvme.c implements it as follows:

   if (flags & BDRV_REQ_MAY_UNMAP) {
       cdw12 |= (1 << 25);
   }

   This sets the Deallocate bit.  But if it's not set, the device may
   still deallocate:

   """
   If the Deallocate bit (CDW12.DEAC) is set to '1' in a Write Zeroes
   command, and the namespace supports clearing all bytes to 0h in the
   values read (e.g., bits 2:0 in the DLFEAT field are set to 001b)
   from a deallocated logical block and its metadata (excluding
   protection information), then for each specified logical block, the
   controller:
   - should deallocate that logical block;

   ...

   If the Deallocate bit is cleared to '0' in a Write Zeroes command,
   and the namespace supports clearing all bytes to 0h in the values
   read (e.g., bits 2:0 in the DLFEAT field are set to 001b) from
   a deallocated logical block and its metadata (excluding protection
   information), then, for each specified logical block, the
   controller:
   - may deallocate that logical block;
   """

   https://nvmexpress.org/wp-content/uploads/NVM-Express-NVM-Command-Set-Specification-2021.06.02-Ratified-1.pdf

b) set BDRV_REQ_NO_FALLBACK in supported_zero_flags

   Again, it's not clear what qemu expects here, but without it we end
   up in a ridiculous situation where specifying the "don't allow slow
   fallback" switch immediately fails all efficient zeroing requests on
   a device where Write Zeroes is always efficient:

   $ qemu-io -c 'help write' | grep -- '-[zun]'
    -n, -- with -z, don't allow slow fallback
    -u, -- with -z, allow unmapping
    -z, -- write zeroes using blk_co_pwrite_zeroes

   $ qemu-io -f rbd -c 'write -z -u -n 0 1M' rbd:foo/bar
   write failed: Operation not supported

Thanks,

                Ilya

