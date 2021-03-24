Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2808E34792A
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 14:02:52 +0100 (CET)
Received: from localhost ([::1]:46714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP39v-0007hA-6D
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 09:02:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lP37y-0006rL-R2
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 09:00:50 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:36794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lP37w-0004P8-Le
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 09:00:50 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so1125798pjh.1
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 06:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=VFZ/41CXWnOIy0ckwhHz/ayA1SdUEuXhdRThD6alwkw=;
 b=lo98+DEI0vWlpil5MXBGmNpJwlQIJxruaTLKjQI1sg61dozpPM5uaaejF7qdEctnNs
 XEq7h+ZFUGzSsw8ShgC+iRwcEtvkFXNeVuGW+7H+jy0n1oRAvg7MrWMFYe+nZi+n8PoR
 DcLNNfu9b/8gLg7LTNfJ7ZGdl+3KD2u8jQ+y7GQm3eq9cK6UFG4sOjaBU4jqXe8ZxYkB
 HTm8tDzCcFsq7jBqfuTeRXNPoJ2nDgUmjyzWzHC5UaANnkgeKwywzWgzX3xh3JSoycwE
 tfaSg/vsCWNo6P8vgrHs+N7OMuVKU5nyHVgLP588XKVZtl5LXgN9z49Wq2mpWUzXIhCG
 0STQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=VFZ/41CXWnOIy0ckwhHz/ayA1SdUEuXhdRThD6alwkw=;
 b=ugVbWWE/VSlM/5by8XEj5m5v1GiRGCobxR0olvVqETKn0Gx6p+aLz5zH4gitVMYFl2
 ea2FDiZu5P7oHVfR3n8Oxonyul55hacXdHLHVAdKEb9ovZF9r/gtIKmkRxp6xVKrfnll
 Qug1IaaYM9oHKYVjVS1YslWVfx03yTwnFnfeNfoHL2ixS59v6mmCJAKi2fKUE008uDbs
 orJIl+1B9D+xmH3QeI09StipxD93aU/+d25e7YNhoEuS2IasktEkxQFLkAzaGYLEIIO6
 76tvBCfWqRhaqU7MH3sWTUoyQr8spasmN5GQkl6v8DLS73piVomMHyf/+E73KC6EYehs
 8wXw==
X-Gm-Message-State: AOAM530joRaqJmuYzcQ+KkmwbQo6nvsJ1OsEpUIp4dLVP48UlEKk9WSv
 r9tcwPh5gvBXZwtishN03KtzqkAob1HjyV+dbw8=
X-Google-Smtp-Source: ABdhPJxUYSGoxs/6QM3PmOzK+jX9rryI7Jm3hlLvUADDKNnI2Tx2GEqrp8l1qtmuoMylmW9oBVT9oRRI9ep9VSUPu4Y=
X-Received: by 2002:a17:902:e2d4:b029:e4:be01:1d9a with SMTP id
 l20-20020a170902e2d4b02900e4be011d9amr3555900plc.43.1616590846916; Wed, 24
 Mar 2021 06:00:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210319132527.3118-1-ma.mandourr@gmail.com>
 <20210319132527.3118-9-ma.mandourr@gmail.com>
 <YFn4EP0GiQTqPDu9@stefanha-x1.localdomain>
 <CAD-LL6iYvHZt8mJZdiHLyUYsDq3kBy0HrTR6_K0x6iCLE1POoA@mail.gmail.com>
In-Reply-To: <CAD-LL6iYvHZt8mJZdiHLyUYsDq3kBy0HrTR6_K0x6iCLE1POoA@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 24 Mar 2021 13:00:35 +0000
Message-ID: <CAJSP0QXEguzz4K-R4qJsM-yXHsD10pB5zTADFYprzYb6ifRDcA@mail.gmail.com>
Subject: Re: [PATCH 8/8] virtiofsd/fuse_virtio.c: Changed allocations of
 locals to GLib
To: Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=stefanha@gmail.com; helo=mail-pj1-x102f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 24, 2021 at 7:12 AM Mahmoud Mandour <ma.mandourr@gmail.com> wrote:
>
> On Tue, Mar 23, 2021 at 4:15 PM Stefan Hajnoczi <stefanha@gmail.com> wrote:
>>
>> On Fri, Mar 19, 2021 at 03:25:27PM +0200, Mahmoud Mandour wrote:
>> > @@ -588,7 +587,7 @@ out:
>> >      }
>> >
>> >      pthread_mutex_destroy(&req->ch.lock);
>> > -    free(fbuf.mem);
>> > +    g_free(fbuf.mem);
>> >      free(req);
>>
>>        ^--- was FVRequest allocation changed in a previous patch?
>>             Maybe an earlier patch forgot to use g_free() here.
>>
>> Aside from this:
>>
>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>
>
> I did not change the allocation of FVRequest. I believe that's why
> this is left unchanged.

Okay, I see it's allocated by libvhost-user and not directly by virtiofsd code.

Thanks,
Stefan

