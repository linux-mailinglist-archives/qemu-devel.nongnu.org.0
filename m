Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A14DA6ACD9A
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 20:10:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZGDe-0004mu-I3; Mon, 06 Mar 2023 14:09:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pZGDb-0004ml-Nv
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 14:09:55 -0500
Received: from esa2.hc2706-39.iphmx.com ([216.71.152.49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pZGDZ-00075C-Vd
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 14:09:55 -0500
X-IronPort-RemoteIP: 209.85.160.198
X-IronPort-MID: 263225684
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:wIRZoajY3Ze/tYiRCQl15JHnX1613hIKZh0ujC45NGQN5FlHY01je
 htvWWCBM6qKNjH2KdB0bd6x8U4C75/UxodgSVE5rXg1F3gW8JqUDtmndXv9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPTwP9TlK6q4mhA5QRgPaojUGL2zBH5MrpOfcldEFOlGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiM+t5qK23CulQRrukoPD8fwXG8M49m/c3Gd/
 /0W3XC4YV9B0qQhA43xWTEBe811FfQuFLMqvRFTGCFcpqHLWyKE/hlgMK05FYwXx8d5PTFxz
 M47DDINMB/biObu763uH4GAhux7RCXqFIYWu3Ul1C2ASPh/EMCFTKLN6ttVmjw3g6iiH96EP
 5tfOWcpNUqYJUQeaj/7C7pn9AusrnD7YztUsnqfuOw673W7IAlZiua2aoCIJIzWLSlTtmGq9
 z7qxCf9OyE1G97H4COM2VuCvcaayEsXX6pXTtVU7MVCmVCW2ykfBQMbUXO9pv+2jFP4XMhQQ
 3H44QIrpKk2sVW3F5zzBkzo5nGDuREYVpxbFOhSBByx95c4Kj2xXgAsJgOtovR/3CPqbVTGD
 mO0ou4=
IronPort-HdrOrdr: A9a23:t3881KqEywtgV3Me7clGslAaV5r9eYIsimQD101hICG9vPbo8P
 xGuM5rqCMc6QxhIk3I/OrrBEDuewK/yXcY2/h1AV7mZnibhILKFvAY0WKB+UyYJ8SWzIc0vt
 YCT0E9MqyJMbETt6bHCWKDYrAdKbe8gcSVrNab5VtWCS9RV4FcwzFQNju7e3cGOzWuxqBUKH
 Nf3Kd6TvabF0j/p/7VZ0U4Yw==
Received: from mail-qt1-f198.google.com ([209.85.160.198])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Mar 2023 14:09:49 -0500
Received: by mail-qt1-f198.google.com with SMTP id
 c11-20020ac85a8b000000b003bfdd43ac76so5732364qtc.5
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 11:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1678129788;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=919izXJOa4nP3vQHMCQKBByrzhO2cKAtfKTphdSLIFk=;
 b=mGRK8FzEP+xpdskVL2aO8l65zA8K1zDbhHdMcWZ95E6s+0lMbCo8Gwu8+5yZO/+dBN
 Ro4Pxf/FSPNclNew4j1pR5N9o8P57xHC5kk+6k6bLAetCTuO1VuXXleRCnbzCHsndTJh
 dvfj6ELEo/ek6M9cZ40V6GYeKjbBQ0xjVcSqGlQnENtn9CPICaNMaDnKZKFdwsyorscr
 1B5CRD0nInht20P9KnkLlf67PdvVtmK/QwR7yhopIs7dPypdKVvbDqmUql8Czabwlxba
 Dhjh6jgVUqVs/AGUuTXAyt/JRPp0jws9lrHJF8qAgMoqdAaMWlKLXF0BkhCWPTb3utjW
 HIBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678129788;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=919izXJOa4nP3vQHMCQKBByrzhO2cKAtfKTphdSLIFk=;
 b=n34uKv6/rUHoYJYec5adubXxDFHfuDpfrVBV2E+EBc6hLJrP09A779pV4SdpevNby5
 oWVjQRyiFDsS89dt6vJ0qvb/TamTJwrL6zbuLocxbX8W1NWxsn6dn2TrpFVLWXQwY0HP
 BCtD2QrMGHFQbrXC58XTa8HCu5liR+VLSx72sOHNrr2S6jYAa5tYJWXJ0UhzGa5/eHyC
 XOuNANu2QKW+MxRsRkdLgfOE620zuLEsZikHvjTLce7LJl3m62H7NGcJIfsrYZwQFJBq
 9e80AKydblpDC/RXfdWl5PKUUjuFI3XTvfHkq4yWxAmB/r8AultEC0yHXpXfHJELwPSz
 UJcA==
X-Gm-Message-State: AO0yUKU2me3EjB5P/aC5uM9pIwbe6aqS+SKmBcy7GO7+pVoAgp8u6aWB
 kxthWWJqqcRnbllPxxgENPZK19x7q8KJ6AmybsQ9EtfQarSnudqO7udHhOldlnrvuCQoY1Ume3Q
 wfnA7LZifK38cjGUh8iqS7qO3MfCP+w==
X-Received: by 2002:a05:6214:234f:b0:56e:a39f:f060 with SMTP id
 hu15-20020a056214234f00b0056ea39ff060mr21907917qvb.19.1678129788478; 
 Mon, 06 Mar 2023 11:09:48 -0800 (PST)
X-Google-Smtp-Source: AK7set9KPXxar/tFooE66ZGh86UNavyEfSNd0czzE0yvyc+/ZLKaUknQo43lWnZAMyl8kbUYnM5m2g==
X-Received: by 2002:a05:6214:234f:b0:56e:a39f:f060 with SMTP id
 hu15-20020a056214234f00b0056ea39ff060mr21907892qvb.19.1678129788199; 
 Mon, 06 Mar 2023 11:09:48 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 t62-20020ae9df41000000b0073b7f2a0bcbsm7981055qkf.36.2023.03.06.11.09.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 11:09:47 -0800 (PST)
Date: Mon, 6 Mar 2023 14:09:44 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: byzero <byzero512@gmail.com>
Cc: qemu-devel@nongnu.org
Subject: Re: Is the fix for "DMA MMIO reentrancy" in qemu stable now?
Message-ID: <20230306190944.usi4fr3d66xdzhej@mozz.bu.edu>
References: <CA+LXE64nmGveP834FfUKxfrGN5dGX-615-OvFsTSLCuoKombmw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+LXE64nmGveP834FfUKxfrGN5dGX-615-OvFsTSLCuoKombmw@mail.gmail.com>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.152.49; envelope-from=alxndr@bu.edu;
 helo=esa2.hc2706-39.iphmx.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 230302 1627, byzero wrote:
> Hi,
> The bug class of MMIO reentrancy is fixed by adding a member "memory" in
> the struct "MemTxAttrs", but the patch only exists in 7.x version, which is

As a side-note, that patch doesn't fix the entire class of
DMA-reentrnacy bugs. There are still active DMA reentrancy issues. I
believe this is the closest we have to a "global" fix is which will
hopefully make it into mainline qemu soon:
https://lore.kernel.org/all/20230205040737.3567731-1-alxndr@bu.edu/

> only release version, but not stable version. The latest stable version is
> 6.1, and there is no stable version being released for nearly a year.
> According to the docs(https://www.qemu.org/download/): "The stable trees
> are located in branches named stable-X.YY branch, where X.YY is the release
> version.".
>   So I want to know that if the patch is stable enough? Will the community
> be possible to change the way for fixing the bug class?
>   thanks for reading this email.

