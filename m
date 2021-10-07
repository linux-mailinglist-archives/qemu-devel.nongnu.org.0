Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 627A5424C8C
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 06:42:55 +0200 (CEST)
Received: from localhost ([::1]:42576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYLF7-00020h-UZ
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 00:42:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mYLCN-00016a-Od
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 00:40:03 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:41551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mYLCM-0004X8-0E
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 00:40:03 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 na16-20020a17090b4c1000b0019f5bb661f9so4162914pjb.0
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 21:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=LwYJF+Y4wl1u0xbNOmuY98t7YDEOXKuSKOp7Oa9S4Oc=;
 b=A5Vf0Wu9mk3uF9rLtB2Qzi5roxYRPKCqHjOm4yIKFKvEy0j1LoVXW6xiSA0z8QJJbe
 LzuGiee1p/KCOrUH4fjdEkiWjFNb1EDRZksQX2DWcUrfOdeBkNxlJe0nb2jmYfGoaZh0
 /u6BF12CjsqT4EF3T7RGZzPnSUhhDfR5ZvCM7q/tCHMeBsVAxX3LBGlFaefvHcvrgD1U
 lPK2tN4KhqQGqZcrXIUv+Traxp2cLNzB4VvUKyBoWElIhTn5LKJTDanVAH9ValPo0cX3
 FRsefl27BxMKG9Cn70K1MQ9kWyFge0D+F/UtaGCqcHXAlfEIvnDVyasW/muSmFbLgJ+d
 hN5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=LwYJF+Y4wl1u0xbNOmuY98t7YDEOXKuSKOp7Oa9S4Oc=;
 b=eBTTtiBAEV0lHGJToJcN9VOVHp5gOPcw36b8xSfVUu8cz4Teub/6esxobQd3KBDFeh
 7CUFsKW44CBuaKUKSCtkgvPvAO1lKTbKdfH7/4WGOg+zMr2yxTczthGfXp1nJFeAmjJH
 nsXUW0P923+V945eKV6F5bwfgszcrDKZ2tRZt49jZEfAyrDDNACHPbbqWIUtxPubP9xv
 MO0G3n6AkhUsCykY3uGynYxDCXht9keNIrGHOnTI64JPBNpJALEfrD+8Bs9PAzre5/Sl
 JMQLo/NuMkKtKlt3C3CSm/fJelBzd/vVG1roHLAKqLW/E3U+5oUldtDPzS47Ns83rZ4U
 nWxw==
X-Gm-Message-State: AOAM532lQDnMMAQrchX3FK1e0MNoz5D/lIuuqUOqIJNI7anga1Wr9l0h
 FwcEOnuqMXriTWnJ9EerKvTJRA==
X-Google-Smtp-Source: ABdhPJwvjwJ3eBuUMqawv6P8qNXqYMHrwZCGMZ0v0/tKZLWUU68PRz3EH641emB20Qs/rLCbZZEsfA==
X-Received: by 2002:a17:90a:bf91:: with SMTP id
 d17mr3002553pjs.158.1633581600207; 
 Wed, 06 Oct 2021 21:40:00 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.196.214])
 by smtp.googlemail.com with ESMTPSA id q18sm27358006pfj.46.2021.10.06.21.39.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 21:39:59 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Thu, 7 Oct 2021 10:09:53 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH] ACPI ERST: specification for ERST support
In-Reply-To: <abc8898c-9795-83df-3374-78267cfc09bf@oracle.com>
Message-ID: <alpine.DEB.2.22.394.2110071007560.820442@anisinha-lenovo>
References: <1628202639-16361-3-git-send-email-eric.devolder@oracle.com>
 <20211006065808.1054102-1-ani@anisinha.ca>
 <alpine.DEB.2.22.394.2110061229270.820442@anisinha-lenovo>
 <abc8898c-9795-83df-3374-78267cfc09bf@oracle.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::1032;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, Ani Sinha <ani@anisinha.ca>,
 imammedo@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Wed, 6 Oct 2021, Eric DeVolder wrote:

>
>
> On 10/6/21 2:00 AM, Ani Sinha wrote:
> >
> >
> > On Wed, 6 Oct 2021, Ani Sinha wrote:
> >
> > > From: Eric DeVolder <eric.devolder@oracle.com>
> > >
> > > > ---
> > > > docs/specs/acpi_erst.txt | 147 +++++++++++++++++++++++++++++++++++++++
> > > > 1 file changed, 147 insertions(+)
> > > > create mode 100644 docs/specs/acpi_erst.txt
> > > >
> >
> > OK it did not come out the way I wanted. But
> >
> > Acked-by: Ani Sinha <ani@anisinha.ca>
> >
> thank you!

So this patchset was sent when I was still not in MAINTAINERS file. Hence
I was not on the CC list. Its a little hard to send reviews when the
patches are not in my inbox (this resulted in the mess above). So if you
have pending updates to the patch series, maybe you can spin out a new
revision and I can review it more comfortably (this time hopefully I will
be on the cc list).


