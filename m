Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF27539B6C
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 04:58:22 +0200 (CEST)
Received: from localhost ([::1]:55352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwEYv-0004QH-DK
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 22:58:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1nwEY1-0003dZ-7a; Tue, 31 May 2022 22:57:25 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:35706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1nwEXz-00015i-EB; Tue, 31 May 2022 22:57:24 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-30c1b401711so4649197b3.2; 
 Tue, 31 May 2022 19:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NeKEryMZMiPW5TRBJ7PF5fRAdiF42Wk8L4lJG25lgxY=;
 b=TpOifCtBFA647nlq2p7qyUhkgMhZRTaYwCdoa66jQo1DZr3Ob8fX/BHa6ERZjuCayM
 VyMOeTG+h48wry7d/ePKAR3flwo2dHoCNFsAn9Mzj+JVE7R+vakS8MPATczLXfeYAO16
 W9bgqVwRNXvkub8Fz0vRYvZ2k5W3CbO8hGAHIz/PM7VwxA4d2YGvan1YQcex6U9yknks
 H/ztMvsO5Q4aattXNusJWUzznvxmS4JoYgnd9yM0w8S3yQ/D8y8DU+ATFZ6Mv22d1mDN
 RVTPfqwpv4fu96SLFNhUhzj0OdEjmLcLlK8CznGVVl8QIKwqoyfL8qRPCV+hBozSa3xC
 lTtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NeKEryMZMiPW5TRBJ7PF5fRAdiF42Wk8L4lJG25lgxY=;
 b=jkR0MJ50520OWbb1rBw6md1PoLWcgL1K0M6ATgoJWGrHk7UHBMclMY40q8kvREe7FT
 KYuifNwNQFpsteaqi1jLd58IjecuDrj0KJdSIRcu304ewAmB7yYDnM16d3AaolwLVdBK
 QHHI/ZbtfA23pM2iYuThL/BzjTIiwuZZfybRj1rw62q8xx1YYb2QBOniakMl960XRQeP
 tCxsssBFow3kUYGxmJwL1IiCyRmLuMH7vZn3wvlB+1Ef87bbo2qi7VjyN7e1mGqK3wxD
 maNyCEvUWTIMiplBMdtvTycbpPLC8a/FNFekaxrzQHtUj2jtlQNeiJS47EPxbbI4+Qfu
 V/GA==
X-Gm-Message-State: AOAM531X1/4DZFlA28luQj4Qd5DyL3+2rA2AftmRacC6faKrqNPRJAkf
 wR9Q7cHpm6Jl+iswLorhu+4rgC4YNjSCE++C5yg=
X-Google-Smtp-Source: ABdhPJwB4/eGm3M9djnvJ2YGY3C6VMWoFTks5KY2j1Z4H5ZEaiDUcLWukrn0TBctEYvyrtfihSo1BkP9WYarLYjKOyA=
X-Received: by 2002:a0d:cd04:0:b0:300:4784:caa3 with SMTP id
 p4-20020a0dcd04000000b003004784caa3mr39093234ywd.231.1654052241890; Tue, 31
 May 2022 19:57:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAAAx-8+ECfznYPcJqPvP=7fzfgQobU1t+kGhGzWvArjm_Xs_yg@mail.gmail.com>
 <CAJSP0QURQOD79ixL2j__uBCuaJL19sytKpMr6QT2QY_+VnQPtg@mail.gmail.com>
In-Reply-To: <CAJSP0QURQOD79ixL2j__uBCuaJL19sytKpMr6QT2QY_+VnQPtg@mail.gmail.com>
From: Sam Li <faithilikerun@gmail.com>
Date: Wed, 1 Jun 2022 10:57:17 +0800
Message-ID: <CAAAx-8LsXQ=w7QTz0JHfGp6gbgY5najE0N7K0yBwhdqqH+E6Eg@mail.gmail.com>
Subject: Re: Outreachy project task: Adding QEMU block layer APIs resembling
 Linux ZBD ioctls.
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Damien Le Moal <damien.lemoal@wdc.com>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, 
 Hannes Reinecke <hare@suse.de>, qemu-devel <qemu-devel@nongnu.org>,
 qemu block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=faithilikerun@gmail.com; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi Stefan,

Stefan Hajnoczi <stefanha@gmail.com> =E4=BA=8E2022=E5=B9=B45=E6=9C=8830=E6=
=97=A5=E5=91=A8=E4=B8=80 19:19=E5=86=99=E9=81=93=EF=BC=9A


>
> On Mon, 30 May 2022 at 06:09, Sam Li <faithilikerun@gmail.com> wrote:
> >
> > Hi everyone,
> > I'm Sam Li, working on the Outreachy project which is to add zoned
> > device support to QEMU's virtio-blk emulation.
> >
> > For the first goal, adding QEMU block layer APIs resembling Linux ZBD
> > ioctls, I think the naive approach would be to introduce a new stable
> > struct zbd_zone descriptor for the library function interface. More
> > specifically, what I'd like to add to the BlockDriver struct are:
> > 1. zbd_info as zone block device information: includes numbers of
> > zones, size of logical blocks, and physical blocks.
> > 2. zbd_zone_type and zbd_zone_state
> > 3. zbd_dev_model: host-managed zbd, host-aware zbd
> > With those basic structs, we can start to implement new functions as
> > bdrv*() APIs for BLOCK*ZONE ioctls.
> >
> > I'll start to finish this task based on the above description. If
> > there is any problem or something I may miss in the design, please let
> > me know.
>
> Hi Sam,
> Can you propose function prototypes for the new BlockDriver callbacks
> needed for zoned devices?

I have made some modifications based on Damien's device in design part
1 and added the function prototypes in design part 2. If there is any
problem or part I missed, please let me know.

Design of Block Layer APIs in BlockDriver:
1. introduce a new stable struct zbd_zone descriptor for the library
function interface.
  a. zbd_info as zone block device information: includes numbers of
zones, size of blocks, write granularity in byte(minimal write size
and alignment
    - write granularity: 512e SMRs: writes in units of physical block
size, 4096 bytes; NVMe ZNS write granularity is equal to the block
size.
    - zone descriptor: start, length, capacity, write pointer, zone type
  b. zbd_zone_type
    - zone type: conventional, sequential write required, sequential
write preferred
  c. zbd_dev_model: host-managed zbd, host-aware zbd

 2. implement new functions as bdrv*() APIs for BLK*ZONE ioctls
   a. support basic operations: get the APIs working when executing
the zone operations from a guest
    - zone information access: report
    - zone manipulation: reset,open,close,finish
  b. support zone append operation: zone capacity, write pointer
positions of all zones(excluded for now)
    - can track the zone state we need: zone is full or not.

More specifically, the function prototypes for 2a are as follows:

int zbd_report_zones(int fd, off_t offset, off_t len, enum
zbd_report_opetion ro, struct zbd_zone *zones, unsigned int
*nr_zones);
int zbd_reset_zones(int fd, off_t offset, off_t len);
int zbd_open_zones(int fd, off_t offset, off_t len);
int zbd_close_zones(int fd, off_t offset, off_t len);
int zbd_finish_zones(int fd, off_t offset, off_t len);

>
> Stefan

