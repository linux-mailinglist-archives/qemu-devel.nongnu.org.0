Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF53E686DE8
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 19:26:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNHo1-0008Cw-9J; Wed, 01 Feb 2023 13:26:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <freddy77@gmail.com>)
 id 1pNHnz-0008Bx-45
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 13:25:59 -0500
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <freddy77@gmail.com>)
 id 1pNHnw-000676-6m
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 13:25:58 -0500
Received: by mail-oi1-x233.google.com with SMTP id s124so16493330oif.1
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 10:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LgfMOvn/2T9XvAzgSkTtJjfBG4GPKlGsgg/edIAt6Wg=;
 b=eUE6DPvA6OlE9+dKmGgNISofxKOk+7blGsflzPnzQRMFDGuJhjjV0EYAD6Quagpjya
 dIKP2yvaytyv1UbMsIpLdYAmHO5TzHgbJ+bkFkvYeB1DoPKLjjzwm/NvKX8uMG8uFFSR
 hdJhEuUIyF7m6m4NIAud1i46+FWkpW64VboeHEiaT4mOzFPp1fovVMpme9ZZOUejNni0
 17Sav7CXS2EwqHXyzFWrgWfUfm9cvoND4J0vW3o/mohR+GkZCj3jefcMyeYuWwc5IzOH
 v0Wc9FIfcgT7l4cI18V1jDAQ0XbdgZExpAYGkMMYdQg3U3nobRkJQyT7E7sK9Pcrhppk
 +dAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LgfMOvn/2T9XvAzgSkTtJjfBG4GPKlGsgg/edIAt6Wg=;
 b=uQeKkM+ODAzlWxGeKgE/UjE2L4IzP92tDX4qd4ihtisn7MFnseLfzPa/GsrZTd/QLO
 lcbfcq38qpbBDAsBLu9FxbQGnWZjvGqQSzJQbymBFdx0SolYmauFz2ZarjruKqoYmDrg
 VkVAIvbENju3xT5juB71Pto3L3aiHyXlk0pvNXtk6Peu2cArP/FXAk6NY97a51bZf6xc
 iloW3Oabt1mBF1q2gV/l4YEs3eph663ujNn5HagU+HNgz2bwwb4UW2+OP/ARLHhOaqcr
 kpqV7LqwMv+t3xAdkhcTqMPNQUgCpfeU18qqbBuvPJ77UxS09PAKsaTGPBQg0ExjzEr+
 toog==
X-Gm-Message-State: AO0yUKWUg0j2pGaySRefeYZ83jDlWPDqCDUKPCgt/jIb56LjR2wAxTJM
 pBPKPOd8fcynoPn0vb1rBhOheMfFLS+sbmjOxuE=
X-Google-Smtp-Source: AK7set+YwEoegBY+ogROOtjLP6C9gQckdC+DAHxLP/fvJfvsQJfWxQyUWMo1lE0PmHb5F8QoNtS743g7f+8TQe+A078=
X-Received: by 2002:a54:4e81:0:b0:378:33d0:ab04 with SMTP id
 c1-20020a544e81000000b0037833d0ab04mr265849oiy.179.1675275954409; Wed, 01 Feb
 2023 10:25:54 -0800 (PST)
MIME-Version: 1.0
References: <20230123083755.1038286-1-vivek.kasireddy@intel.com>
 <20230123083755.1038286-3-vivek.kasireddy@intel.com>
 <20230123100654.bqiauwjbkkqroq7f@sirius.home.kraxel.org>
 <IA0PR11MB71852AF9DF58977B578C2F43F8C99@IA0PR11MB7185.namprd11.prod.outlook.com>
 <CAHt6W4fvhv7TUT2hSYn9Vh4LgucMiRhQoaz92S4mGwdsyPxVhQ@mail.gmail.com>
 <IA0PR11MB718583DF694440C67744C534F8D39@IA0PR11MB7185.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB718583DF694440C67744C534F8D39@IA0PR11MB7185.namprd11.prod.outlook.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Wed, 1 Feb 2023 18:25:43 +0000
Message-ID: <CAHt6W4dRrgsP3fpa20r6wgrW1SYmzR_exN6R3uksnUwsd1-ydA@mail.gmail.com>
Subject: Re: [RFC v2 2/2] spice: Add an option to forward the dmabuf directly
 to the encoder (v2)
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 "Kim, Dongwon" <dongwon.kim@intel.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=freddy77@gmail.com; helo=mail-oi1-x233.google.com
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

Il giorno lun 30 gen 2023 alle ore 02:24 Kasireddy, Vivek
<vivek.kasireddy@intel.com> ha scritto:
>
> Hi Frediano, Gerd,
>
> >
> > Il giorno mar 24 gen 2023 alle ore 06:41 Kasireddy, Vivek
> > <vivek.kasireddy@intel.com> ha scritto:
> > >
> > > + Frediano
> > >
> > > Hi Gerd,
> > >
> > > >
> > > >   Hi,
> > > >
> > > > > Here is the flow of things from the Qemu side:
> > > > > - Call gl_scanout (to update the fd) and gl_draw_async just like
> > > > >   in the local display case.
> > > >
> > > > Ok.
> > > >
> > > > > - Additionally, create an update with the cmd set to QXL_CMD_DRAW
> > > > >   to trigger the creation of a new drawable (associated with the fd)
> > > > >   by the Spice server.
> > > > > - Wait (or block) until the Encoder is done encoding the content.
> > > > > - Unblock the pipeline once the async completion cookie is received.
> > > >
> > > > Care to explain?  For qemu it should make a difference what spice-server
> > > > does with the dma-bufs passed (local display / encode video + send to
> > > > remote).
> > > [Kasireddy, Vivek] I agree that Qemu shouldn't care what the spice-server does
> > > with the dmabuf fds but somehow a drawable has to be created in the remote
> > client
> > > case. This is needed as most of the core functions in the server (associated with
> > > display-channel, video-stream, encoder, etc) operate on drawables. Therefore, I
> > > figured since Qemu already tells the server to create a drawable in the non-gl
> > case
> > > (by creating an update that includes a QXL_CMD_DRAW cmd), the same thing
> > > can be done in the gl + remote client case as well.
> > >
> >
> > This is a hack. It's combining an invalid command in order to cause
> > some side effects on spice server but it also needs a change in spice
> > server to detect and handle this hack. QXL_CMD_DRAW is mainly bound to
> > 2D commands and should come with valid bitmap data.
> >
> > > Alternatively, we could make the server create a drawable as a response to
> > gl_scanout,
> > > when it detects a remote client. IIUC, I think this can be done but seems rather
> > messy
> > > given that currently, the server only creates a drawable (inside
> > red_process_display)
> > > in the case of QXL_CMD_DRAW sent by Qemu/applications:
> > >         switch (ext_cmd.cmd.type) {
> > >         case QXL_CMD_DRAW: {
> > >             auto red_drawable = red_drawable_new(worker->qxl, &worker-
> > >mem_slots,
> > >                                                  ext_cmd.group_id, ext_cmd.cmd.data,
> > >                                                  ext_cmd.flags); // returns with 1 ref
> > >
> > >             if (red_drawable) {
> > >                 display_channel_process_draw(worker->display_channel,
> > std::move(red_drawable),
> > >                                              worker->process_display_generation);
> > >             }
> > >
> >
> > Yes, it sounds a bit long but surely better than hacking Qemu, spice
> > server and defining a new hacky ABI that will be hard to maintain and
> > understand.
> >
> > > The other option I can think of is to just not deal with drawables at all and
> > somehow
> > > directly share the dmabuf fd with the Encoder. This solution also seems very
> > messy
> > > and invasive to me as we'd not be able to leverage the existing APIs (in display-
> > channel,
> > > video-stream, etc) that create and manage streams efficiently.
> > >
> >
> > Yes, that currently seems pretty long as a change but possibly the
> > most clean in future, it's up to some refactory. The Encoder does not
> > either need technically a RedDrawable, Drawable but frame data encoded
> > in a format it can manage (either raw memory data or dmabuf at the
> > moment).
> [Kasireddy, Vivek] Ok, I'll work on refactoring Spice server code to pass
> the dmabuf fd directly to the Encoder without having to creating drawables.
>
> Thanks,
> Vivek
>

Hi Vivek,
   thanks for the effort. I'll try to help although I'll be pretty
busy for a while.

I'd try (consider them only as suggestions) to edit
display_channel_gl_scanout, dcc_gl_scanout_item_new,
display_channel_gl_draw, dcc_gl_draw_item_new to handle requests from
Qemu. Specifically in dcc_gl_scanout_item_new and dcc_gl_draw_item_new
you probably want to remove the check and error for Unix sockets. As
code you wrote in Qemu you will need to create a new surface (if not
already there or if size changed) handling a new scanout. Also
probably better to create a VideoStream specifically for GL surfaces.
How to have some code shortcut to deliver the GL surface directly to
the stream? No much suggestions.
It would probably be nice to add an additional method in VideoEncoder
(video-encoder.h) to accept a GL surface instead of a SpiceBitmap.

Frediano

> >
> > > >
> > > > >  #ifdef HAVE_SPICE_GL
> > > > > +        } else if (spice_dmabuf_encode) {
> > > > > +            if (g_strcmp0(preferred_codec, "gstreamer:h264")) {
> > > > > +                error_report("dmabuf-encode=on currently only works and tested"
> > > > > +                             "with gstreamer:h264");
> > > > > +                exit(1);
> > > > > +            }
> > > >
> > > > IMHO we should not hard-code todays spice-server capabilities like this.
> > > > For starters this isn't true for spice-server versions which don't (yet)
> > > > have your patches.  Also the capability might depend on hardware
> > > > support.  IMHO we need some feature negotiation between qemu and spice
> > > > here.
> > > [Kasireddy, Vivek] Ok, I can get rid of this chunk in v3. However, given the
> > numerous
> > > features supported by the Spice server, I suspect implementing feature
> > negotiation
> > > might get really challenging. Is there any other way around this that you can
> > think of?
> > >
> > > Thanks,
> > > Vivek
> > >
> > > >
> > > > take care,
> > > >   Gerd
> > >
> >
> > Frediano

