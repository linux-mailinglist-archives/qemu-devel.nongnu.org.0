Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D983060C6C8
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 10:45:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onFNK-000491-R0; Tue, 25 Oct 2022 04:33:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1onEbr-0005dN-IR
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 03:44:27 -0400
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1onEbl-0004O8-IY
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 03:44:27 -0400
Received: by mail-lj1-x22b.google.com with SMTP id o4so10859802ljp.8
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 00:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rZ21WjEYfs8M/dKKzH+3h0EXOwPdptvUrAruz+vydc4=;
 b=Lav3MHfc8pxz0ufjSqNy1IG7KzlJCTAjRqvQOHU8bZ+u0Lb4YWztG2s1l0GVbwxvHQ
 gBllBbJkBk/ym/XRZAzPlHEIRHq5m7cQdHungoncceo6HsplyYnr/Uo5IEbNWDB0Zs1B
 99EoPUJSPEqzrQ4C38vrjg7jplflNNUZjDL0z/xFf5bAi0nWeYomm71iT6VkEU/ZBmQZ
 yLHJHJ5fjjwXeA8UWjhOrbNucyCKP0DhCcge1ECLwx4/i7lSagOC6dyi3D5otJ7g3pnb
 ynIFPM/S++5uoUEAGc6GQG4DAv8IWEXVHZpYHbGuJDLaPU1/hOJmZYI3fxn1YLhIv8gz
 2SWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rZ21WjEYfs8M/dKKzH+3h0EXOwPdptvUrAruz+vydc4=;
 b=kuAdar7Ip84DONU+pK5bCfWQXOErh204pPO7nGhE8BpZ6tEqFMtRC0DMRf6xGxCipy
 9pJST3VEpkqMR4iyoCVxNCqSXUmAJVuCmQ8KxpUc8DeCwrXZ8ru27BNWKthwxsPSfVc4
 3luCvhjmHBLabeh65vLIvSqP9jNRjN7sdpu0z/7eBRL87QXHVnJ2EhzhnX5JQQgze/3T
 2JTNi1HVlDLlwRxLA2M86JtfALlTVLKY2cxAnQwPf9h6dmWucHY9YWjceRhsVkoAYHtD
 TWKYvypxLW6wZ9MTkuyopU6/OPMpDBhaHc15zQyzlj1ZHtpkobinff+UO9E9k0ShEDP5
 tFBQ==
X-Gm-Message-State: ACrzQf0aFu72pZD0/H6xTvV8/hqB3jM2dLBfl0HLq7yDrafm/yt1AWed
 vDwaxwAoCq2C4dGHsWuIU1UlNkU7Yvd7ok7PcmU=
X-Google-Smtp-Source: AMsMyM6WHBma1GOmolYeq7DIYOIJwB9RvSlOyXT/F1eIhNFCTCavevlv0Mf8lGpFrZbMSLNy1R6K/qQgKj3+0dyT4sc=
X-Received: by 2002:a2e:8e28:0:b0:277:11fe:f9b5 with SMTP id
 r8-20020a2e8e28000000b0027711fef9b5mr1934721ljk.463.1666683859277; Tue, 25
 Oct 2022 00:44:19 -0700 (PDT)
MIME-Version: 1.0
References: <20221022160052.1132-1-vr_qemu@t-online.de>
 <CAJ+F1CLjiCs4zSxSpr_OPWDM9_xCC0YfJTL_82umDB-rX6aW3Q@mail.gmail.com>
 <b3c5e4b6-0208-0b0d-fef4-b536ce889dfc@t-online.de>
In-Reply-To: <b3c5e4b6-0208-0b0d-fef4-b536ce889dfc@t-online.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 25 Oct 2022 11:44:07 +0400
Message-ID: <CAJ+F1C+HmS7Y8Wu88uwr5DVcspstGS+MMFAH_QB5Cd3LiVxoNA@mail.gmail.com>
Subject: Re: [PATCH] tests/qtest/ac97-test: add up-/downsampling tests
To: =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi

On Tue, Oct 25, 2022 at 12:31 AM Volker R=C3=BCmelin <vr_qemu@t-online.de> =
wrote:
>
> Am 24.10.22 um 10:13 schrieb Marc-Andr=C3=A9 Lureau:
> > Hi
> >
> > On Mon, Oct 24, 2022 at 9:28 AM Volker R=C3=BCmelin <vr_qemu@t-online.d=
e>
> > wrote:
> >
> >     Test if the audio subsystem can handle extreme up- and down-
> >     sampling ratios like 44100/1 and 1/44100. For some time these
> >     used to trigger QEMU aborts. The test was taken from
> >     https://gitlab.com/qemu-project/qemu/-/issues/71 where it was
> >     used to demonstrate a very different issue.
> >
> >     Suggested-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >     Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>
> >
> >
> > Thanks for working on this
> >
> > It seems to show something different though:
> > "
> > A bug was just triggered in audio_calloc
> > Save all your work and restart without audio
> > I am sorry
> > "
> >
> > AUD_open_out() is called with audsettings: {freq =3D 1, nchannels =3D 2=
,
> > fmt =3D AUDIO_FORMAT_S16, endianness =3D 0}
> >
> > And that's it. Any idea?
>
> Hi,
>
> the scary message is expected and doesn't mean this qos-test failed.
> This is the currently not so silent 'the audio subsystem should (...)
> silently give up' case.


Ok, but it's not silent. According to the AC97 spec, "if the value
written to the register is supported that value will be echoed back
when read, otherwise the closest (higher in case of a tie) sample rate
supported is returned". We should probably pick a low sample rate,
like 8000 (see Table 32 in spec 2.1) for anything below it.

>
>
> The noaudio backend uses a mixing-engine buffer size of 1024 audio
> frames and AUD_open_* tries to allocate memory for 1024/44100 =3D 0.0232
> audio frames for the resample buffer in audio_pcm_sw_alloc_resources_*.
> This allocation fails and produces the scary message. The error is
> handled correctly and AUD_open_* returns NULL. AUD_read and AUD_write
> return early if this pointer is NULL and the audio frontend callback
> functions will also not be called because the audio_frontend_frames_*
> functions return 0 in this case.

Thanks, it'd be nice to have such a description in the commit message.



--=20
Marc-Andr=C3=A9 Lureau

