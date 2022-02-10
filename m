Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8344B0DCD
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 13:51:31 +0100 (CET)
Received: from localhost ([::1]:53714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI8v4-00043F-1M
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 07:51:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nI8dQ-0000j2-44
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 07:33:18 -0500
Received: from [2607:f8b0:4864:20::1035] (port=35609
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nI8dM-0004nO-8P
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 07:33:15 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 a11-20020a17090a740b00b001b8b506c42fso8449432pjg.0
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 04:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=8ObZGsvRcZQsCY6LjM3+OBO86CqdVLdS81leK0T+21M=;
 b=mt/Nuc7oHqHgNDx6owC2TNxvjjzKgkL+Z9Bgp5nmxNgh7j6jZtbm32UvLjwB7HWvZr
 EpN54oPO66MbAIdq9OZVUjj5zAqap+CVG4N01SUSdnGmZ2qvNyMTa8HmaigJ/NDKVZ0B
 7JL1EjPO12wET9O8nI9tCXTW3scP7X3YYi7KvO9GJ8P/TbABbbWYRQXZd2xfzTIb4TNB
 djHHgG9EbhtnpvlC17JpHZ4aAiX9dEkbKGOZhOBlLPYW7I9CXJdsTqTd3wAvU7DMazj4
 V9lG/dtqIHqQ7YwHINA6J9DHtRgbafvdWc3CrG+5KeN7CV6dkrC4W69iHu1txEryWStW
 BYew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=8ObZGsvRcZQsCY6LjM3+OBO86CqdVLdS81leK0T+21M=;
 b=IPcgE7xvsDQmjOTl9i4woA/IqTQBNAb+WHd9RXClFEjNK4XlTrInMR+Hnrr8QKM+pc
 g3hpJTnXjrMToq7N4/6GrT12CxkEI8pZqLT9iRtbRet2ZlqsHzPeQgnvbrUm1C8WvzS+
 BVSRkgupEq1XJ6YmblqBPyVAzLTSss3jKmFz3dWndoupXHjRdK/n5rJS4A0WmVjB2MQZ
 sDAzcEtw+Gj0Dx4nvDQX2sxBaUX0DxEaRLP7qDWOhp74cNKcjTuMFwAWc7cnOYBq8ZFO
 BnAZR8RvOyDV6mN8mmcOmph8QflDiYP9Ke9zSKxhWxf4/ZwnrxVJxzIQxAuwKpqjtnB8
 8zQA==
X-Gm-Message-State: AOAM533Depv39WGf/Os6TQn0brpg5Q1fF49qbnn2CVDnpheS5d/LjDU7
 rzJ4WC6IkruXgazb+NIzmPCE0w==
X-Google-Smtp-Source: ABdhPJw/ovLdO9r/R+0YBIOQJWlTQOdcm7R+N5mamlawbIO8Dd+h0sdyr7tba0cXIEoruAuFfba9/w==
X-Received: by 2002:a17:902:e54d:: with SMTP id
 n13mr7367677plf.120.1644496374267; 
 Thu, 10 Feb 2022 04:32:54 -0800 (PST)
Received: from anisinha-lenovo ([115.96.148.209])
 by smtp.googlemail.com with ESMTPSA id 142sm15060022pfy.11.2022.02.10.04.32.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 04:32:53 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Thu, 10 Feb 2022 18:02:48 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH v2] hw/smbios: fix memory corruption for large guests
 due to handle overlap
In-Reply-To: <CAARzgwzRRzt_oBaYFbmD+cpGeNgHMq5TcOvWiSVZ8eL159XERQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2202101802140.2941252@anisinha-lenovo>
References: <20220203130957.2248949-1-ani@anisinha.ca>
 <20220204103423.71ec5c6b@redhat.com>
 <20220204110558.h3246jyelrvhto5q@sirius.home.kraxel.org>
 <20220204131805.3a225566@redhat.com>
 <CAARzgwzRRzt_oBaYFbmD+cpGeNgHMq5TcOvWiSVZ8eL159XERQ@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::1035;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 gsomlo@gmail.com, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Fri, 4 Feb 2022, Ani Sinha wrote:

> On Fri, Feb 4, 2022 at 17:48 Igor Mammedov <imammedo@redhat.com> wrote:
>
> > On Fri, 4 Feb 2022 12:05:58 +0100
> > Gerd Hoffmann <kraxel@redhat.com> wrote:
> >
> > >   Hi,
> > >
> > > > Another question is why we split memory on 16Gb chunks, to begin with.
> > > > Maybe instead of doing so, we should just add 1 type17 entry describing
> > > > whole system RAM size. In which case we don't need this dance around
> > > > handle offsets anymore.
> > >
> > > Maybe to make the entries look like they do on physical hardware?
> > > i.e. DIMM size is a power of two?  Also physical 1TB DIMMs just
> > > don't exist?
> >
> > Does it have to be a DIMM, we can make it Other/Unknown/Row of chips/Chip
> > to more close to builtin memory that's is our main ram is.
>
>
> My concern here is even though the spec has provisions for those form
> factors I wonder if the guests only expect dimm ? Will it break some guest
> operating system?

I am not sure if we have come to any conclusion here. However, I have sent
a v2 patch series with Igor's suggestion addressed.

