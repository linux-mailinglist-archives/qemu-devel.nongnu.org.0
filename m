Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B72F134A325
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 09:26:22 +0100 (CET)
Received: from localhost ([::1]:55900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPhnR-0005a1-Qm
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 04:26:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnd@arndb.de>) id 1lPhmO-00055a-1V
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 04:25:16 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:38593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnd@arndb.de>) id 1lPhmM-0007NO-8L
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 04:25:15 -0400
Received: from mail-ot1-f41.google.com ([209.85.210.41]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M7s1M-1lLptl2cy2-004zgb for <qemu-devel@nongnu.org>; Fri, 26 Mar 2021
 09:25:11 +0100
Received: by mail-ot1-f41.google.com with SMTP id
 k14-20020a9d7dce0000b02901b866632f29so4537574otn.1
 for <qemu-devel@nongnu.org>; Fri, 26 Mar 2021 01:25:11 -0700 (PDT)
X-Gm-Message-State: AOAM531TBUcAHI+VcHChb1OtRG1zOw3VvtVLUx6ehp5CK5RS2BSYiexe
 dYOZzenp/l5Fe9GgIVwzdOTVwr9KPXa/RODsrFA=
X-Google-Smtp-Source: ABdhPJxwvWvESfPTd02t+IoFzzcp+uwHFtku6RecXmeZzQv/Ma0pYPI21NV5X2ZN/+P2KhqlfpghX55GrZwNUDFm3ZA=
X-Received: by 2002:a9d:316:: with SMTP id 22mr10917006otv.210.1616747110076; 
 Fri, 26 Mar 2021 01:25:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1616570702.git.viresh.kumar@linaro.org>
 <c269da55e0b3ff984bf538e3001efc4732c6dea7.1616570702.git.viresh.kumar@linaro.org>
 <CAK8P3a198aR8d0qUPg124O_P7bzO+Yagwe9ydprSGj789ydn2w@mail.gmail.com>
 <20210326071451.4m6ff5on5kwznx3v@vireshk-i7>
In-Reply-To: <20210326071451.4m6ff5on5kwznx3v@vireshk-i7>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 26 Mar 2021 09:24:54 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3FrWnvbDbOJANJw4=vSRqbHd_kHhNhnc6rHMMbx++n8w@mail.gmail.com>
Message-ID: <CAK8P3a3FrWnvbDbOJANJw4=vSRqbHd_kHhNhnc6rHMMbx++n8w@mail.gmail.com>
Subject: Re: [PATCH 3/5] tools/vhost-user-i2c: Add backend driver
To: Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:4ntH6FkuIIw+Nbn4C4rfD0kXcEGTs4uuITRxGn1JwQp6VEy9y/0
 Nee06UqKl7Hf5zkumDWsKyL0xYFUoNqbFJu0A1o86pzdImxvZP9Jhj1DTAGBS58gztvvu/x
 y61bz5nNsUUZ+uDoNaKPopZKv8XGlViCUB3OCgnyWaz8WuMCVyLJ3x3FLIuljU7AFGUHwFR
 B5YERZm7yNRL7fw30IWFA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ovew43WhR7g=:EMhQxa8qO1E8mkyXHdG51H
 H/QWb6EO+JMgAJyhG2Qm77e3sf6++JDRRH5ueApXIZAuJ1LmoWNTqkEfZy2jogBCzd+SIe3Ga
 fk4+WcSKiPvB9HbnrrkYjDRzrK4sJKT5zy4O4ZRhhXzg/vnb7VkDGOD0N7VhLE0qF96WDg7Te
 EoaYKHf/TBiRB3ENgUVZBKdkDw9KKkPdA/dWR06RtVu4A7aamteasSjukXqLIiN19bl14XD3k
 5BUtF0qqDZebFvn3n0tAUyepuFia7jqaxleg/CL8l0PBwEVGCPoqEbU+Kq/bpCk8wWKZcQO3Z
 QTF4s3nhYxMHv14SVybLAjBFtxFTml7bpF18RET692xeilyKQZeYctwnKIwLfqiWQLwsRyeRB
 DQzV3YADtj4gVGVXu9N6DRfYwb2ujnRDpnNHtJuNLh+zRmGesslGfBd/d/oFpb7TBHv7bhIaV
 iPDEXdE1AxP8tS3QQigXX4kPj4Q0x48=
Received-SPF: none client-ip=212.227.17.24; envelope-from=arnd@arndb.de;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Jie Deng <jie.deng@intel.com>,
 Bill Mills <bill.mills@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Arnd Bergmann <arnd.bergmann@linaro.com>, Mike Holmes <mike.holmes@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Stratos Mailing List <stratos-dev@op-lists.linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 26, 2021 at 8:14 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On 25-03-21, 17:16, Arnd Bergmann wrote:
> > On Wed, Mar 24, 2021 at 8:33 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:

> >
> > It looks like you are not handling endianness conversion here. As far as I
> > can tell, the protocol requires little-endian data, but the code might
> > run on a big-endian CPU.
>
> I hope this is all we are required to do here, right ?
>
> @@ -442,7 +421,7 @@ static void vi2c_handle_ctrl(VuDev *dev, int qidx)
>          out_hdr = elem->out_sg[0].iov_base;
>
>          /* Bit 0 is reserved in virtio spec */
> -        msg.addr = out_hdr->addr >> 1;
> +        msg.addr = le16toh(out_hdr->addr) >> 1;
>
>          /* Read Operation */
>          if (elem->out_num == 1 && elem->in_num == 2) {
> @@ -489,7 +468,7 @@ static void vi2c_handle_ctrl(VuDev *dev, int qidx)
>          in_hdr->status = fail_next ? VIRTIO_I2C_MSG_ERR : vi2c_xfer(dev, &msg);
>          if (in_hdr->status == VIRTIO_I2C_MSG_ERR) {
>              /* We need to fail remaining transfers as well */
> -            fail_next = out_hdr->flags & VIRTIO_I2C_FLAGS_FAIL_NEXT;
> +            fail_next = le32toh(out_hdr->flags) & VIRTIO_I2C_FLAGS_FAIL_NEXT;
>          }
>
> These are the only fields we are passing apart from buf, which goes
> directly to the client device.

I think so, the in_hdr is only one byte long, so it doesn't have an
endianness.

       Arnd

