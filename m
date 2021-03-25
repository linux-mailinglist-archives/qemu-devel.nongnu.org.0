Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E7234884F
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 06:23:45 +0100 (CET)
Received: from localhost ([::1]:45706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPITA-0003N4-D7
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 01:23:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1lPIS9-0002x6-7S
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 01:22:41 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:39542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1lPIS7-0001vk-E4
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 01:22:40 -0400
Received: by mail-pg1-x533.google.com with SMTP id l76so649232pga.6
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 22:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=ZiFC0tehJEXcbI5i87SBsEC80uwHfZynh1HxtOTYEW4=;
 b=fp8dytARxca71Ru7ihRW+M3LApZs2/17Y6DLCgWGwefkIcqgpWLxj4Ug5tCacSYZIf
 oRdiEnH8fO1RiBs3ckE/nsEQnXSEDE0Z4GkwxdHzCV82j13GZz3b1PV33Mp8nvNOnedB
 oCKfA7WbpEw8B+MXOqYir3wkiuoPQNXjSIQZnoKuxH80J/lsmBI/7PPXRAWnFe/sJljU
 zEQY2/vGnZxzGI2JC5D7r+gyOtWKY/Ij82JmomMnAYM/+J1c/oGNoaOmHCvGINxRmzEH
 EzTvUSOyvmPT3Dzl8qiJgQDc05v5Nygi98YlzeWr9E9Z4JPRQxndsyNWKtYrwXRcWMNg
 Patw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=ZiFC0tehJEXcbI5i87SBsEC80uwHfZynh1HxtOTYEW4=;
 b=Yxe7mVZiYgLirBXCuA3xQYeCxFmKTSZpQIiSxJgf4r8Iu1xCfyjb/JzdWUunYPkDwe
 iWe5bKm86eOcHvSwBcIj49y1ho0q9FIbNBaCkgoptpR45fC7qACFnXbSgW3yy2ZlHXTR
 by/UeqTh2EZfAJ4DonxLZ7Ku3y8FPG/w6lu4QGQkUiy1arD17g3t3Wg1TRGy2V0BEbuI
 UQffi3iUjzdJkg91jFBkRzqJq28RInDDsX0C1oxIaDvmkMlzLGSoKxoxQU+KZ06UKkbi
 JTHNL1gcwnc9i4bAbKd0p3aCuRIosgX/wJBqebC7TMRYziOzFHlCIPp+WpGQOCO2g9Tz
 J8iw==
X-Gm-Message-State: AOAM5314+lnm0mF5lbOy56IdfqfsCtUWVOr08yIDcNQg/CgNcJmZkLaF
 xmEgU+1QuuP6XyqFhZ/s+54tSg==
X-Google-Smtp-Source: ABdhPJzih7VfQ0Xax/cZM9TRC0iDgbT4Y1E/V7ynJure+cTLkJGTb1i0E2pgJCaD7i3kkDqz+4evtw==
X-Received: by 2002:aa7:8187:0:b029:213:d43b:4782 with SMTP id
 g7-20020aa781870000b0290213d43b4782mr6337004pfi.26.1616649755574; 
 Wed, 24 Mar 2021 22:22:35 -0700 (PDT)
Received: from localhost ([122.172.6.13])
 by smtp.gmail.com with ESMTPSA id w188sm4183198pfb.4.2021.03.24.22.22.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Mar 2021 22:22:30 -0700 (PDT)
Date: Thu, 25 Mar 2021 10:52:27 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Jie Deng <jie.deng@intel.com>
Subject: Re: [PATCH 3/5] tools/vhost-user-i2c: Add backend driver
Message-ID: <20210325052227.fm3i25xphhu26amu@vireshk-i7>
References: <cover.1616570702.git.viresh.kumar@linaro.org>
 <c269da55e0b3ff984bf538e3001efc4732c6dea7.1616570702.git.viresh.kumar@linaro.org>
 <290a8771-7273-a898-a826-c97df6eefb1b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <290a8771-7273-a898-a826-c97df6eefb1b@intel.com>
User-Agent: NeoMutt/20180716-391-311a52
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=viresh.kumar@linaro.org; helo=mail-pg1-x533.google.com
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 Bill Mills <bill.mills@linaro.org>, qemu-devel@nongnu.org,
 Arnd Bergmann <arnd.bergmann@linaro.com>, Mike Holmes <mike.holmes@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25-03-21, 13:09, Jie Deng wrote:
> 
> On 2021/3/24 15:33, Viresh Kumar wrote:
> > +
> > +/* Definitions from virtio-i2c specifications */
> > +#define VHOST_USER_I2C_MAX_QUEUES       1
> > +
> > +/* Status */
> > +#define VIRTIO_I2C_MSG_OK               0
> > +#define VIRTIO_I2C_MSG_ERR              1
> > +
> > +/* The bit 0 of the @virtio_i2c_out_hdr.@flags, used to group the requests */
> > +#define VIRTIO_I2C_FLAGS_FAIL_NEXT      0x00000001
> > +
> > +/**
> > + * struct virtio_i2c_out_hdr - the virtio I2C message OUT header
> > + * @addr: the controlled device's address
> > + * @padding: used to pad to full dword
> > + * @flags: used for feature extensibility
> > + */
> > +struct virtio_i2c_out_hdr {
> > +    uint16_t addr;
> > +    uint16_t padding;
> > +    uint32_t flags;
> > +} __attribute__((packed));
> 
> 
> __le16,  __le32 ?

Maybe, but I didn't do them because of this:

docs/devel/style.rst:

"Don't use Linux kernel internal types like u32, __u32 or __le32."
 
> > +
> > +/**
> > + * struct virtio_i2c_in_hdr - the virtio I2C message IN header
> > + * @status: the processing result from the backend
> > + */
> > +struct virtio_i2c_in_hdr {
> > +    uint8_t status;
> > +} __attribute__((packed));
> > +
> 
> I understand these definitions can be removed once the frontend driver is
> merged by the Linux ?

Yes, we would be required to somehow include the uapi header that
kernel is adding and then this won't be required.
 
> > +/* vhost-user-i2c definitions */
> > +
> > +#ifndef container_of
> > +#define container_of(ptr, type, member) ({                      \
> > +        const typeof(((type *) 0)->member) *__mptr = (ptr);     \
> > +        (type *) ((char *) __mptr - offsetof(type, member));})
> > +#endif
> 
> 
> This seems to be a general interface.  I see there is a definition in
> qemu/compiler.h.
> 
> Can we reuse it ?

Damn. My bad (maybe not). I picked this part from the RPMB patchset
that Alex sent and didn't bother looking for it.

Though on the other hand, we are looking to make this file independent
of qemu so it can be used by other hypervisors without any (or much)
modifications, and maybe so it was done so.

Alex ?

-- 
viresh

