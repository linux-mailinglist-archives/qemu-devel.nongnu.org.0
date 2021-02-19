Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A4931FDC9
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 18:23:14 +0100 (CET)
Received: from localhost ([::1]:43474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD9Un-0000pp-II
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 12:23:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lD9T4-0008Dq-J3
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 12:21:26 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:40515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lD9T2-0000KK-Bb
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 12:21:26 -0500
Received: by mail-wm1-x332.google.com with SMTP id o24so8294828wmh.5
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 09:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=user-agent:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m5UfSk/5dDcG7prREgSNLjG9VTx/8n9DcyPN9AdGYUc=;
 b=SjAZ9ok4zGuzvUlhCF6e9QeR8VnzWNh27Rciw17hLNzlTu4GJ5dfmxzFRWM/7OqcPk
 y1W+VeAwOTihRAv7jAmrUApaIFmxhJM/xRzMXD0/0YqKXwRtyfSAxd5etkCmJZi/y/RI
 U+FAbor3Xf1UktznPWOkvbGL9sqbfn/y64JyzfS+WIkp7+8OAFQPB3PVr4AUvO+xFSDk
 hDeWsQTKSi9yHCfleB6TFHfQZjMDcC4bDP0YzVw24wsLVlYQGkkt6LdoZX85BIWdhElf
 YQrjn9VKoucM0WRrTVKe+O5n6XAi/u41aCbUzzGvgXNeYxtY1cTEX3Cn6vnwUEdmLofl
 gnig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:user-agent:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=m5UfSk/5dDcG7prREgSNLjG9VTx/8n9DcyPN9AdGYUc=;
 b=G3TUSt87YV3dzO5KzcDgCf4qvUkoc6Mb5QJRzo8YZ39RfGDmhCDMxvVJSW8BJf6dJd
 iudY1ZsbgkwSrJYWI/W334gqPDB3qCcy1eYyJnzwM6Mc3GhT5YRX6cjGKPaCVZsSo11Q
 2NeAOfE+m21uAaJSR9QwDf2AiNkFsG1RdXoBZVlaUYpNn81VxerldtItrcX6KKj7L2G4
 9s+UXs3AaaxLMrKbJ12QwatMSU6+fVurQLINbaZ8hUO8UQpmvLHsKLMZmJWlw0ufBo4+
 3vnLputUXFEk4eIWHGBwrEC0HUoSwdpt6TP78KaKirI62bDk6y0gRBMgG+i7PdDvm6cK
 wjXw==
X-Gm-Message-State: AOAM5330nQmleof85zXHD6ZRKTBfJAYRvtiT3ftRz5dM8IRFQF378xRG
 nwnQEHMW/6Y+r56K5+w4F4IXHQ==
X-Google-Smtp-Source: ABdhPJxeeBL7jHo+HsFArXtxw77djeMLzFd8LxOxb3KYC3Dd1xLBH6YpH5IeHxj7yF1jtEHl2NIJUA==
X-Received: by 2002:a1c:e446:: with SMTP id b67mr9193660wmh.65.1613755282704; 
 Fri, 19 Feb 2021 09:21:22 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l17sm2531932wmq.46.2021.02.19.09.21.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 09:21:21 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B6D831FF7E;
 Fri, 19 Feb 2021 17:21:20 +0000 (GMT)
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org, "rust-vmm@lists.opendev.org"
 <rust-vmm@lists.opendev.org>
Subject: vhost reply_ack negotiation (a.k.a differences in vhost-user
 behaviour with libvhost-user and vhost-user-backend.rs)
Date: Fri, 19 Feb 2021 16:04:34 +0000
Message-ID: <8735xskm7j.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I finally got a chance to get down into the guts of vhost-user while
attempting to port my original C RPMB daemon to Rust using the
vhost-user-backend and related crates. I ended up with this hang during
negotiation:

  startup

  vhost_user_write req:1 flags:0x1
  vhost_user_read_start
  vhost_user_read req:1 flags:0x5
  vhost_user_backend_init: we got 170000000
  vhost_user_write req:15 flags:0x1
  vhost_user_read_start
  vhost_user_read req:15 flags:0x5
  vhost_user_set_protocol_features: 2008
  vhost_user_write req:16 flags:0x1
  vhost_user_write req:3 flags:0x1
  vhost_user_write req:1 flags:0x1
  vhost_user_read_start
  vhost_user_read req:1 flags:0x5
  vhost_user_write req:13 flags:0x1

  kernel initialises device

  virtio_rpmb virtio1: init done!
  vhost_user_write req:13 flags:0x1
  vhost_dev_set_features: 130000000
  vhost_user_set_features: 130000000
  vhost_user_write req:2 flags:0x1
  vhost_user_write req:5 flags:0x9
  vhost_user_read_start

The proximate cause is the vhost crate handling:

  MasterReq::SET_MEM_TABLE =3D> {
      let res =3D self.set_mem_table(&hdr, size, &buf, rfds);
      self.send_ack_message(&hdr, res)?;
  }

which gates on the replay_ack_enabled flag:

    fn send_ack_message(
        &mut self,
        req: &VhostUserMsgHeader<MasterReq>,
        res: Result<()>,
    ) -> Result<()> {
        if dbg!(self.reply_ack_enabled) {
            let hdr =3D self.new_reply_header::<VhostUserU64>(req, 0)?;
            let val =3D match res {
                Ok(_) =3D> 0,
                Err(_) =3D> 1,
            };
            let msg =3D VhostUserU64::new(val);
            self.main_sock.send_message(&hdr, &msg, None)?;
        }
        Ok(())
    }

which is only set when we have all the appropriate acknowledged flags:

    fn update_reply_ack_flag(&mut self) {
        let vflag =3D VhostUserVirtioFeatures::PROTOCOL_FEATURES.bits();
        let pflag =3D VhostUserProtocolFeatures::REPLY_ACK;
        if (self.virtio_features & vflag) !=3D 0
            && (self.acked_virtio_features & vflag) !=3D 0
            && self.protocol_features.contains(pflag)
            && (self.acked_protocol_features & pflag.bits()) !=3D 0
        {
            self.reply_ack_enabled =3D true;
        } else {
            self.reply_ack_enabled =3D false;
        }
    }

which from above you can see QEMU helpfully dropped those bits in the
reply. It does however work in the C/libvhost version:

  virtio_rpmb virtio1: init done!
  vhost_user_write req:13 flags:0x1
  vhost_dev_set_features: 130000000
  vhost_user_set_features: 130000000
  vhost_user_write req:2 flags:0x1
  vhost_user_write req:37 flags:0x9
  vhost_user_read_start
  vhost_user_read req:37 flags:0x5
  vhost_user_write req:8 flags:0x1
  vhost_user_write req:10 flags:0x1
  vhost_user_write req:9 flags:0x1
  vhost_user_write req:12 flags:0x1
  vhost_user_write req:13 flags:0x1

albeit with a slightly different message sequence
(VHOST_USER_ADD_MEM_REG instead of VHOST_USER_SET_MEM_TABLE). Reading
the C code you can see why:

    need_reply =3D vmsg.flags & VHOST_USER_NEED_REPLY_MASK;

    reply_requested =3D vu_process_message(dev, &vmsg);
    if (!reply_requested && need_reply) {
        vmsg_set_reply_u64(&vmsg, 0);
        reply_requested =3D 1;
    }

So regardless of what may have been negotiated it will always reply with
something if the master requested it do so. This points us at the
specification which reads:

  - Bit 3 is the need_reply flag - see :ref:`REPLY_ACK <reply_ack>` for
    details.

which says in VHOST_USER_PROTOCOL_F_REPLY_ACK that this bit should only
be honoured when the feature has been negotiated. Which brings us to a
series of questions:

 - Should QEMU have preserved VhostUserVirtioFeatures::PROTOCOL_FEATURES
   when doing the eventual VHOST_USER_SET_FEATURES reply?

 - Is vhost.rs being to strict or libvhost-user too lax in interpreting
   the negotiated features before processing the ``need_reply`` [Bit 3]
   field of the messages?

 - are VHOST_USER_SET_MEM_TABLE to VHOST_USER_SET_INFLIGHT_FD included
   in the "list of the ones that do" require replies or do they only
   reply when REPLY_ACK has been negotiated as the ambiguous "seealso::"
   box out seems to imply?

Currently I have some hacks in:

  https://github.com/stsquad/vhost/tree/my-hacks

which gets my daemon booting up to the point we actually need to do a
transaction. However I won't submit a PR until I've worked out exactly
where the problems are.

--=20
Alex Benn=C3=A9e

