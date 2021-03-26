Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF8B34A331
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 09:35:45 +0100 (CET)
Received: from localhost ([::1]:60922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPhwW-0008AQ-Nk
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 04:35:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnd@arndb.de>) id 1lPhv9-0007k7-Rj
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 04:34:19 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:33597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnd@arndb.de>) id 1lPhv5-0004iI-BD
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 04:34:18 -0400
Received: from mail-oi1-f178.google.com ([209.85.167.178]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MsI0K-1lfa503tCU-00tkQl for <qemu-devel@nongnu.org>; Fri, 26 Mar 2021
 09:34:13 +0100
Received: by mail-oi1-f178.google.com with SMTP id m13so4935175oiw.13
 for <qemu-devel@nongnu.org>; Fri, 26 Mar 2021 01:34:12 -0700 (PDT)
X-Gm-Message-State: AOAM530k7WSLDm0XC21wGP72TqFkWckUTFKfMj+Mc2fKKqAk/Nv7z0yN
 FwXHDM8QBatxFCGgcZ7FHUHcq1gqPIvN8tEBvgE=
X-Google-Smtp-Source: ABdhPJw7s5e5cxw0vWgB1Id9Z05kDBBkMql11F6lPK7C5scVqWe3q1J2/CDGSGHiim4UK19tjQQdUdrItY0UuwSEdMc=
X-Received: by 2002:a05:6808:3d9:: with SMTP id
 o25mr9170994oie.4.1616747651413; 
 Fri, 26 Mar 2021 01:34:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1616570702.git.viresh.kumar@linaro.org>
 <c269da55e0b3ff984bf538e3001efc4732c6dea7.1616570702.git.viresh.kumar@linaro.org>
 <CAK8P3a198aR8d0qUPg124O_P7bzO+Yagwe9ydprSGj789ydn2w@mail.gmail.com>
 <20210326060151.lznoke6vmg5u5lvc@vireshk-i7>
In-Reply-To: <20210326060151.lznoke6vmg5u5lvc@vireshk-i7>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 26 Mar 2021 09:33:56 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1CEDEMgXJUep+7=AqXDwphgBaS931RAB_NxAMQ4ZhVRg@mail.gmail.com>
Message-ID: <CAK8P3a1CEDEMgXJUep+7=AqXDwphgBaS931RAB_NxAMQ4ZhVRg@mail.gmail.com>
Subject: Re: [PATCH 3/5] tools/vhost-user-i2c: Add backend driver
To: Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Ax6hx3/XbSBpPc//Caqb4s8yQ1/xevgPX/Rh8dsFmpClVDYKcHp
 YhwaIqcdcmx/pnWwz7fC2gXMpkEujQom7VQXQ9MO58Trs5nEdWlP1bJ7UdYFZ5rbslpJXMK
 dfXhMRuHGO1/kQ8stBVhRJSdonibd64LemliMoDvdtaKHgOmtxNmotzSTSxRd2TgtEE7JSn
 etCT67aCaX07LQ3LiIDsg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mBKeO5R64JI=:P3vU3vduGJBrXg8rsmTaBx
 5+8enjl5ZqztYM7TzEyMCcrLpIRfQt9snTmrY6yuEjQ5I1Rmw4UrAn5PwS9Dnh+tb5c6BlLj6
 UYtiWylV7VGs4ehPqgL4mPlQCRLCCT78NNGzM3qNweCasgQwnt4boQPuiGmCA/OnR3Bp5DyqS
 6Ns9lh1EeKN8YjXu+hS+HDz3urWpSaNBpXIt7reY1MAGclWF8Oo+G8o0+HEJwVpZ6Gk06MFBS
 RhM4W2bYNnqiKy/EfVd8qw2w4ittzx4XGud3l1+MRMdN6baH6txIu4AEJ0bVdcKhGq1uKhNeJ
 QlgWLUsj9+xrvTjuLqBWdosxCSPRALWoc7MmFYXA0taQgh6WX9Q/4ga4CkcUzBU0WZcMXFHSf
 nOQU2ZkeiTN677aOKgAjlbUTwWHAdY9+W+kkttAQuKHyUGlPkKl+/XN6+VyknV24IY8tEP3/9
 HoWEU5DeVb4SnseQBJhfRX7lVxpFtgWLm8U1QvI8Wu5CLPYIkCyqSqiLyuDNGXR2mwSl+71H4
 28hPVKYiCq5Rf4EAsQ8AiOmKUZVv8t0MAWtlkFAGXZifsJ9tV1CEQEph30/xZ2ebnMEYWdQWZ
 WbsfLA6cinb7fVmg6Hgu93oTQI+ldX6wdR
Received-SPF: none client-ip=217.72.192.75; envelope-from=arnd@arndb.de;
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

On Fri, Mar 26, 2021 at 7:01 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On 25-03-21, 17:16, Arnd Bergmann wrote:
> > On Wed, Mar 24, 2021 at 8:33 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > > +static uint8_t vi2c_xfer(VuDev *dev, struct i2c_msg *msg)
> > > +{
> > > +    VuI2c *i2c = container_of(dev, VuI2c, dev.parent);
> > > +    struct i2c_rdwr_ioctl_data data;
> > > +    VI2cAdapter *adapter;
> > > +
> > > +    adapter = vi2c_find_adapter(i2c, msg->addr);
> > > +    if (!adapter) {
> > > +        g_printerr("Failed to find adapter for address: %x\n", msg->addr);
> > > +        return VIRTIO_I2C_MSG_ERR;
> > > +    }
> > > +
> > > +    data.nmsgs = 1;
> > > +    data.msgs = msg;
> > > +
> > > +    if (ioctl(adapter->fd, I2C_RDWR, &data) < 0) {
> > > +        g_printerr("Failed to transfer data to address %x : %d\n", msg->addr, errno);
> > > +        return VIRTIO_I2C_MSG_ERR;
> > > +    }
> >
> > As you found during testing, this doesn't work for host kernels
> > that only implement the SMBUS protocol. Since most i2c clients
> > only need simple register read/write operations, I think you should
> > at least handle the common ones (and one two byte read/write)
> > here to make it more useful.
>
> I am thinking if that is what we really want to support, then
> shouldn't the i2c virtio spec be updated first to support SMBUS type
> transfers as well?

As far as I can tell, all the simple devices should just work, with
I2C_FUNC_SMBUS_READ_BLOCK_DATA being the main exception,
but it seems that has practically no users.

       Arnd

