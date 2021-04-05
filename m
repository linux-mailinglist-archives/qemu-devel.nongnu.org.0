Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C73353BC8
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 07:29:49 +0200 (CEST)
Received: from localhost ([::1]:45362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTHo3-0003gX-Mp
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 01:29:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1lTHn9-0003Hm-O3
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 01:28:51 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:43833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1lTHn7-0004jh-Uo
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 01:28:51 -0400
Received: by mail-pl1-x62d.google.com with SMTP id v8so5135310plz.10
 for <qemu-devel@nongnu.org>; Sun, 04 Apr 2021 22:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=QPRknOZXoRUoxX2ELAShgvRmq2NcZour0nhHxNMQf5o=;
 b=Xsyj88UluBWxl8wT0rlEpPhuQRvm4KnFroY82kJONkpWjzqdCfxkCbirh+Uof6Tlw0
 kfziFtrVfIrOHHSwRQd1zfK54ZdzwjxXyFmgX/9MbMi0/lcDbdnsEiX8uqpotJuOSa3s
 VUSssFn7CpmuwiP6oFQmEhgV+4UThvtCe5kqwDCKyeM29dT638pPO/dO/s7K18bhV1Cz
 eLFyXMlBuT8awHqNwO18zs4tEhC5r5oDX+5xOQ8muP+kbk3y4Yfb0JHX81W2+1v+1laq
 AUhWLXhg/cZsQ09j/nt8ZgiVT0DOuPsj3rOqxJ0fhIJDFWZqx8P2pRvPoiM5KHKEY0qo
 FDxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QPRknOZXoRUoxX2ELAShgvRmq2NcZour0nhHxNMQf5o=;
 b=DYCddDfig587miNcAPg8VYsvyKjaN5S5G5FjK7dS8zScrCfgT238OxEpf28ibS0PgD
 tzSnGAeLcjl8NGCiZNvh93HHRKeUN1m07S0utxqd9ArhJTNXLEmrwidFefwcaa22THNz
 VeoruYUoCL4FJ+/m5Y/3k6ze4AmGIqi5aP0Qq3CQGmyvcHdmX/xmc0Mg/QHKGkdhb+SQ
 JurFAAGT+7WQNaHIiJj0fC3kKcVPsm9KUpsbpZe3IocH1BfBJ1I3noUrlfP5si5D7cK8
 X/lMfvvUJyDF5PCTglw6LYgi4OHTgwxNgHnK+Or9L9nibEB0PEUYVxOIsjm4FSeVjzHc
 64Tw==
X-Gm-Message-State: AOAM530scw+xcDfsWMsAUXRLd/nX8XPaNJmfRUulq2MUayjeRXc2caVq
 5qRYZOo0FeqQpEcPH8YjgS+8jg==
X-Google-Smtp-Source: ABdhPJwEw2GhLNSXzR9b2uNbmA0HZfEcJhYZ4JoUN0YIhVacKMaHYFQShrNKROe6dKTQQMpgXulNkQ==
X-Received: by 2002:a17:90a:1b25:: with SMTP id
 q34mr8592248pjq.230.1617600527833; 
 Sun, 04 Apr 2021 22:28:47 -0700 (PDT)
Received: from localhost ([136.185.154.93])
 by smtp.gmail.com with ESMTPSA id x69sm14679818pfd.161.2021.04.04.22.28.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 04 Apr 2021 22:28:46 -0700 (PDT)
Date: Mon, 5 Apr 2021 10:58:44 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Jie Deng <jie.deng@intel.com>
Subject: Re: [PATCH V2 4/6] tools/vhost-user-i2c: Add backend driver
Message-ID: <20210405052844.hhecmnbvljf7djto@vireshk-i7>
References: <cover.1617278395.git.viresh.kumar@linaro.org>
 <e0adcd9552cee4de0ee844f6b3c87fb2b2f2357c.1617278395.git.viresh.kumar@linaro.org>
 <dd1373df-0e25-fcca-fb7e-669e3fa72739@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd1373df-0e25-fcca-fb7e-669e3fa72739@intel.com>
User-Agent: NeoMutt/20180716-391-311a52
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=viresh.kumar@linaro.org; helo=mail-pl1-x62d.google.com
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

On 02-04-21, 10:55, Jie Deng wrote:
> 
> On 2021/4/1 20:12, Viresh Kumar wrote:
> > +
> > +/* vhost-user-i2c definitions */
> > +
> > +#define MAX_I2C_VDEV                    (1 << 7)
> > +#define MAX_I2C_ADAPTER                 16
> 
> Generally speaking, 16 is big enough for most cases. But comparing with
> static configuration,
> I think it is better if we can check how many adapters in the host when
> doing initialization and
> use that number as "MAX_I2C_ADAPTER".

Hmm, so this doesn't limit the adapter number in /dev/i2cX (i.e. we can still
process /dev/i2c99), but rather how many adapters we can pass in
--device-list="" parameter. And so I feel 16 is big enough and if someone really
needs more, then they can update the macro here.

> > +static VI2cAdapter *vi2c_create_adapter(int32_t bus, uint16_t client_addr[],
> > +                                        int32_t n_client)
> > +{
> > +    VI2cAdapter *adapter;
> > +    char path[20];
> > +    uint64_t funcs;
> > +    int32_t fd, i;
> > +
> > +    if (bus < 0) {
> > +        return NULL;
> > +    }
> > +
> > +    adapter = g_malloc0(sizeof(*adapter));
> > +    if (!adapter) {
> > +        g_printerr("failed to alloc adapter");
> > +        return NULL;
> > +    }
> > +
> > +    snprintf(path, sizeof(path), "/dev/i2c-%d", bus);
> > +    path[sizeof(path) - 1] = '\0';
> > +
> > +    fd = open(path, O_RDWR);
> > +    if (fd < 0) {
> > +        g_printerr("virtio_i2c: failed to open %s\n", path);
> > +        goto fail;
> > +    }
> > +
> > +    adapter->fd = fd;
> > +    adapter->bus = bus;
> > +
> > +    if (ioctl(fd, I2C_FUNCS, &funcs) < 0) {
> > +        g_printerr("virtio_i2c: failed to get functionality %s: %d\n", path,
> > +                   errno);
> > +        goto close_fd;
> > +    }
> > +
> > +    if (funcs & I2C_FUNC_I2C) {
> > +        adapter->smbus = false;
> > +    } else if (funcs & I2C_FUNC_SMBUS_WORD_DATA) {
> 
> 
> Only I2C_FUNC_SMBUS_WORD_DATA is checked here. But in addition to it, the
> smbus_xfer
> seems support I2C_FUNC_SMBUS_BYTE, I2C_FUNC_SMBUS_BYTE_DATA. So if an
> adapter only
> support the latter two, it will never go to smbus_xfer.

Yeah, I missed it. Thanks. I am updating it as:

-    } else if (funcs & I2C_FUNC_SMBUS_WORD_DATA) {
+    } else if (funcs & (I2C_FUNC_SMBUS_WORD_DATA | I2C_FUNC_SMBUS_BYTE |
+                        I2C_FUNC_SMBUS_BYTE_DATA)) {

-- 
viresh

