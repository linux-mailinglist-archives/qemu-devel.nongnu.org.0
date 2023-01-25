Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA07D67B0C2
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 12:11:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKdfv-0006QD-2S; Wed, 25 Jan 2023 06:10:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <freddy77@gmail.com>)
 id 1pKdfr-0006Po-DL
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 06:10:39 -0500
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <freddy77@gmail.com>)
 id 1pKdfp-0004p1-JX
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 06:10:38 -0500
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-15ff0a1f735so12739956fac.5
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 03:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=H5cJWcljm7PIGZR7j/eRUXvbdrx3J5UXW024e8zbdro=;
 b=h3X+FehB3+9/y8I+N1JZWadKqKQ+FjNQfbXXoVbIPVE8zyLI1LWEQdHaAbSj0a//Cr
 NWC8COQLvzA3slpKyrWtDk5ScCdhDVtqXUNE3uNFZzaxdtssRjNZd1T6za18maGQVwHr
 ADGwXFrbR56oF8VjUj6yN7oiYxRDptHDCyEjV3NOMUkJ3JQTZiqputk2GOODmBKCuXFt
 f69rTVU/ddCxwI5tvF0dh6vDbzbAI/s31e3FZKCHfcJ98PqNWAmSnnU3gsNrOtSUNnBe
 awXBZIsiY6J4g1gWqh8V07PwrlrNFdN6oYRkWHmeTlKxu5mLFz/kGYOgd8KpUlS0/jsR
 kXtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H5cJWcljm7PIGZR7j/eRUXvbdrx3J5UXW024e8zbdro=;
 b=xkj607Nn5eukcY5ujmR2WxyTMRCBDLi/f9Mv6otBQGkkwo4r5DzV8WgmyfotOdSO7S
 4rA6kqi6uuphxNDftcjN7HYp9H6Uq/GPvIbu+4Xn2NCVAlS+jCD4/yvsZlrQ0b4r17Bp
 u5Ov1+AKbVdui7g5wgHlV8buQ4vo2mRK9wHaVefQijZOT/28N6wUwWBrVS7FpPGA2cGu
 gyxXbqwgirtSWXC4SptNV+rlsOzxU7teq3fsRwEChq50oRXRAt1v4YhACOP4yU8IjXMB
 seTkOO7+Ubmu4FVrwZc6eOK3KhHDH8NqFK0TuRRADOv4vB1wgP6iYDzptq1S1uNrgFu3
 Nmeg==
X-Gm-Message-State: AO0yUKWo+VRgTpftL25urOcZlItfHuHzSq2CT2gS1Ibwocvr1iFHQOss
 Fy5IizwrsRwUCcncVYVQG7h5rX1vpR+FKT2wT48=
X-Google-Smtp-Source: AK7set+wTG8xP5KcvComII1b//Q84XwwKsm4kpa2JwzzjoeSFhx2kBWSl+eoGj+zxvkFlxcLc4Uli+L4sDVdEqFtzxw=
X-Received: by 2002:a05:6870:a548:b0:163:1a0d:d749 with SMTP id
 p8-20020a056870a54800b001631a0dd749mr480525oal.179.1674645036084; Wed, 25 Jan
 2023 03:10:36 -0800 (PST)
MIME-Version: 1.0
References: <20230123083755.1038286-1-vivek.kasireddy@intel.com>
 <20230123083755.1038286-3-vivek.kasireddy@intel.com>
 <20230123100654.bqiauwjbkkqroq7f@sirius.home.kraxel.org>
 <IA0PR11MB71852AF9DF58977B578C2F43F8C99@IA0PR11MB7185.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB71852AF9DF58977B578C2F43F8C99@IA0PR11MB7185.namprd11.prod.outlook.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Wed, 25 Jan 2023 11:10:24 +0000
Message-ID: <CAHt6W4fvhv7TUT2hSYn9Vh4LgucMiRhQoaz92S4mGwdsyPxVhQ@mail.gmail.com>
Subject: Re: [RFC v2 2/2] spice: Add an option to forward the dmabuf directly
 to the encoder (v2)
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 "Kim, Dongwon" <dongwon.kim@intel.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=freddy77@gmail.com; helo=mail-oa1-x2a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

Il giorno mar 24 gen 2023 alle ore 06:41 Kasireddy, Vivek
<vivek.kasireddy@intel.com> ha scritto:
>
> + Frediano
>
> Hi Gerd,
>
> >
> >   Hi,
> >
> > > Here is the flow of things from the Qemu side:
> > > - Call gl_scanout (to update the fd) and gl_draw_async just like
> > >   in the local display case.
> >
> > Ok.
> >
> > > - Additionally, create an update with the cmd set to QXL_CMD_DRAW
> > >   to trigger the creation of a new drawable (associated with the fd)
> > >   by the Spice server.
> > > - Wait (or block) until the Encoder is done encoding the content.
> > > - Unblock the pipeline once the async completion cookie is received.
> >
> > Care to explain?  For qemu it should make a difference what spice-server
> > does with the dma-bufs passed (local display / encode video + send to
> > remote).
> [Kasireddy, Vivek] I agree that Qemu shouldn't care what the spice-server does
> with the dmabuf fds but somehow a drawable has to be created in the remote client
> case. This is needed as most of the core functions in the server (associated with
> display-channel, video-stream, encoder, etc) operate on drawables. Therefore, I
> figured since Qemu already tells the server to create a drawable in the non-gl case
> (by creating an update that includes a QXL_CMD_DRAW cmd), the same thing
> can be done in the gl + remote client case as well.
>

This is a hack. It's combining an invalid command in order to cause
some side effects on spice server but it also needs a change in spice
server to detect and handle this hack. QXL_CMD_DRAW is mainly bound to
2D commands and should come with valid bitmap data.

> Alternatively, we could make the server create a drawable as a response to gl_scanout,
> when it detects a remote client. IIUC, I think this can be done but seems rather messy
> given that currently, the server only creates a drawable (inside red_process_display)
> in the case of QXL_CMD_DRAW sent by Qemu/applications:
>         switch (ext_cmd.cmd.type) {
>         case QXL_CMD_DRAW: {
>             auto red_drawable = red_drawable_new(worker->qxl, &worker->mem_slots,
>                                                  ext_cmd.group_id, ext_cmd.cmd.data,
>                                                  ext_cmd.flags); // returns with 1 ref
>
>             if (red_drawable) {
>                 display_channel_process_draw(worker->display_channel, std::move(red_drawable),
>                                              worker->process_display_generation);
>             }
>

Yes, it sounds a bit long but surely better than hacking Qemu, spice
server and defining a new hacky ABI that will be hard to maintain and
understand.

> The other option I can think of is to just not deal with drawables at all and somehow
> directly share the dmabuf fd with the Encoder. This solution also seems very messy
> and invasive to me as we'd not be able to leverage the existing APIs (in display-channel,
> video-stream, etc) that create and manage streams efficiently.
>

Yes, that currently seems pretty long as a change but possibly the
most clean in future, it's up to some refactory. The Encoder does not
either need technically a RedDrawable, Drawable but frame data encoded
in a format it can manage (either raw memory data or dmabuf at the
moment).

> >
> > >  #ifdef HAVE_SPICE_GL
> > > +        } else if (spice_dmabuf_encode) {
> > > +            if (g_strcmp0(preferred_codec, "gstreamer:h264")) {
> > > +                error_report("dmabuf-encode=on currently only works and tested"
> > > +                             "with gstreamer:h264");
> > > +                exit(1);
> > > +            }
> >
> > IMHO we should not hard-code todays spice-server capabilities like this.
> > For starters this isn't true for spice-server versions which don't (yet)
> > have your patches.  Also the capability might depend on hardware
> > support.  IMHO we need some feature negotiation between qemu and spice
> > here.
> [Kasireddy, Vivek] Ok, I can get rid of this chunk in v3. However, given the numerous
> features supported by the Spice server, I suspect implementing feature negotiation
> might get really challenging. Is there any other way around this that you can think of?
>
> Thanks,
> Vivek
>
> >
> > take care,
> >   Gerd
>

Frediano

