Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C1B5A2C4B
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 18:27:45 +0200 (CEST)
Received: from localhost ([::1]:54616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRcBM-0003Dc-Gg
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 12:27:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=230e0beed=ross.lagerwall@citrix.com>)
 id 1oRc0K-0006A9-Qb
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 12:16:24 -0400
Received: from esa2.hc3370-68.iphmx.com ([216.71.145.153]:12020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=230e0beed=ross.lagerwall@citrix.com>)
 id 1oRc09-0007hn-Op
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 12:16:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1661530569;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wBmxiUYRutFlU3ee7afhKa//xGK+Zs4OI+xetOAtOwU=;
 b=ENeYSoXEifIZe3fj4AStjOYrD6WHWJxyRYGaPFrR2Ph8o2OR6opCp36t
 RwT31I9MjtiUwKbj4Ko1mo59iqL+FuJVbCajYHGWOYkkcOuSRbb2h3o/E
 h7cLM2DvQlMjQoldZYoK2KF2mLYvkAY55nNot9HeLYemhQiwkZMJPfE/K U=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 79082556
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3A3mYY2q7Bk9SATbH2XKbZTgxR2vbMJdOsbiYv2?=
 =?us-ascii?q?ybJXl9S3hjvphJGC+JDIhk3zKaZZTp5/nptfUGklVhVuIDMq+mIip3j+v39M?=
 =?us-ascii?q?aKZSn+iLIDVIckEZHjYw7qeUQtTsE8rxTp6DHPpfNkWbM2qMPfvVEEvZL8zR?=
 =?us-ascii?q?xZza5hgjOzqm5dxxyJXzxxpbXVxHVtgx0zx92GibZ4kx1hroxSYQGD/uKqmK?=
 =?us-ascii?q?dNZdpsxv0nD+ozp+LavQeLNMb9XWN210h9MNPA5fvJMJ93VzZc/0kg+UVS/J?=
 =?us-ascii?q?VGHQIyPaR/adnlhUCmdlDmA22TTUfHncvZnQJwGvONJ1SzXzXsBpiepIcSIo?=
 =?us-ascii?q?4+MSDYLpheeyA5fn1N75D7wTFqqNxOIPuy622d04z58z8/AwsCb6yeOjTzpY?=
 =?us-ascii?q?v4DmD5ewQz3EZeVbfL+ZwVCbBOFXShKbYQq8HQrmPH+7vKE/ak3IzdjyIZn1?=
 =?us-ascii?q?3ZGdeAedpg2hR+6GLr+OKKPaIfwEtIoS7FD6l6q9jlwh4HQ07RPrXpdnBJ1V?=
 =?us-ascii?q?E69bAnzC2ybQkNOIraR9JCFlcMLUwxtyBOWhgbsQwH+APiwOed4gacu96k8w?=
 =?us-ascii?q?8+20KlIz0ahrtlgg2BMgadOzeEgXuWYPglkRJ5QNvBSuqHqWYusES0bjYmBg?=
 =?us-ascii?q?7UosJc5XQS+LLxrx74iw7Cz2V1wlRFwrcuGfGKR4ItSeLziGCvT1C20D/L/b?=
 =?us-ascii?q?3/eIYO0Rvyo4mYYj6qqvgqWrPOpY+nYNj4mnKk9z9wq+IqqvArqLiCgBfXIn?=
 =?us-ascii?q?Ves53EWs8xmiGrsvBKGDlbDrtxqvFViN2qCvE2a5vgxI1NK+EqKBfaVoRlZq?=
 =?us-ascii?q?cRrJ8AlwwpSAOYbRY1stN7Mtjo64Imi1GGUZkYk8aNQJZGUhC+EPr6uglDqC?=
 =?us-ascii?q?QYBBHKkRzzY9KFgw0toW/zzB9UEJjGjFy0MF8bNs5wJmPRjf0uWO4yB5n/uT?=
 =?us-ascii?q?RYjmlIPSP734/nYjdtbrymXvoUyZzYyANsNwaX+BZ8e39S1ND+wjLJBnFRPT?=
 =?us-ascii?q?S+FGjq72DDx9K5q11jM4RuxXOAFUgTpHKfrNh/QddMizDGijfBnH1XjY6Fbu?=
 =?us-ascii?q?ZlOXeeD1t2q0cZBZ2hst3HlKAEN8gmVMA7UwwDELrrwqUGURynFTDjBN8/YO?=
 =?us-ascii?q?qwvpPr+vWsNmxpbJk6OpeLrIUtes9GIjDvtDHRMpLCqY3d2tPJjraKaQ8hDy?=
 =?us-ascii?q?uXYiHe1THLFHW3V0vaL1z76GX8QlBiqQdvCiDFC3IqfHKlJKz636Ynrs1dv4?=
 =?us-ascii?q?NoNlUHTGziTZOd3z01RVtZJQepEfwpaBp/cgmyEfo6wd9ADoRVYKJThRoCV/?=
 =?us-ascii?q?ljrKDg+x2/IP93KJd0kdf6MKgo6PpZzPWx7ImdKaNVcjnFctqMlO7/MSlOSm?=
 =?us-ascii?q?uPQlMaCHc4dMEOYA7icgmU5PeBG13020mC9QjmsFkOzeVROrvB/T0Ya4Rdtm?=
 =?us-ascii?q?o622+oz2mqMpBhvizjcATL7R+BWSa9rfaJnnEesdu7JtqRHvOvvbwdfxSQOH?=
 =?us-ascii?q?ipynL99OFnEA7/g3nO9pNU5oTjIhcTkcDlmp4uP2Ql2PfoetcpODitzf6Rc0?=
 =?us-ascii?q?/HfX4gH1ssTtdT5LpdLlpBSC/vSfIw7RbuKKJbj5ozGsMPCoDRnb1d2WDqY1?=
 =?us-ascii?q?GRpVvaMjWZ3zDQYb3Vi9BGiomDAHn9C3jT1ZPRdsm6G+SW3Nwi7RoWq7shVu?=
 =?us-ascii?q?LiiXMXIZ7fyOvXefCiiUMG1U+3MaQPgnbkvZTSAGw6CaDCmQ9Hz6aT/UdAqe?=
 =?us-ascii?q?cpZjaHIrxauqSGiWbQ3H58+2RvaDOyU+vramsBPRPliPiIyQIURt8GAy6mK4?=
 =?us-ascii?q?E9LkgN3vsqKyHB4nbxsmWAnStbaRtP3EXkSqrXRMmszAusQNA/r7gQinE44H?=
 =?us-ascii?q?AyJ4FvRdbWI7+2gcwcTqnaTMjDgQ60pBMpvdgd/Vz8oHDaQXWu2XjY1FHRLI?=
 =?us-ascii?q?waAjx5wtrl7uOwmjBUy19NS5mbPmmglsJPSnGuGwoyNZy9WMwAematHiOG/Q?=
 =?us-ascii?q?H2EoZuc8aA9p0TlLIvgIy1rZ/KAREo/gYylKrGtNA723iEEQ3sEVUjCjDkzM?=
 =?us-ascii?q?U1JgfEkqEoN2uJozbICQoqdCGUZp/T658QOKHwsOcYBthWOyUDrl7sVqRdnL?=
 =?us-ascii?q?Za51hfunp+DjznBYKEUPFQrWwteA6d0hYTGckxfJdRSY2PSQqOhme7t6KD6O?=
 =?us-ascii?q?KawWAogpXZ9Gm1P6ilcxvUfH8E9GIvVsKPU1uxGnPp8Z6ebSi1ALS3bKXLsj?=
 =?us-ascii?q?G7Dp9LNIciCQXI0zpYs4bwHoj0lLE3CB0jXVEx52nwJVw5xYXUmPGp7IkHMu?=
 =?us-ascii?q?iyXt0/F+PQmjMFIMmfAMT9rplIfqKrk+lA4P8aAdhdfv/oSJkrRY46Asrwm3?=
 =?us-ascii?q?Q24DOn7PuK8PN2bs+bfU+hUZEXx3AHNPkY7ZsBEdo+2/UNH/uFyurOQrPCe9?=
 =?us-ascii?q?VVN8M5Xw2/Y0pBleVrGJc4ch+eovU0URMGyrtjymJfoIM1qsmodXBxyJo22a?=
 =?us-ascii?q?kRZJq6NEn2U?=
X-IronPort-AV: E=Sophos;i="5.93,265,1654574400"; d="scan'208";a="79082556"
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Aug 2022 12:15:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ScDV72pqS+dNprgf6bQTWrOgpI9vizFDUb6H8gVP10VCQWvWN6UvF+/yfH5l9fgaNlBn2PniYAzeCJ2KVV9D8vbgbYYTsI3iwQpULnsg5b83mdmbeohicqQjjKBusAenxuGx/W8bJL6acv92Psgxb6Z4uyI8YJn2C/8rs5ljfWvcBqt2C6XKMo3pvaqZGtVENvoRvMx4x5TwegPo5jM8z3B06lqVBgHWpsRj87/ciZUSmHJhYFNGMdYFG7qQOYbr/Ie+2esWR2fRw9tMvhvdRggmx8o/+iDVUD8/kAgCZJ1QKyShZjDPhJC9fTbcUWWAyfTYiMEH14jC9fw99Ful7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wBmxiUYRutFlU3ee7afhKa//xGK+Zs4OI+xetOAtOwU=;
 b=LRmKewq4dr4YOqiEjitHAkmdicHp3kTkOL6LQnhK4diLtCwamedxEsiG12NWMvIKVel/GMHvmn/XWAhSf/L1XQhA3fhtoOXO6kTdmrfv3ZDvvp+O5xFIbS2s58svNd0oPfZPw/lPJUsQo/aQDHhhCK9XwX0Wdx88P+2lT3fclwmUaOFAw0ZFJxPjn6/iIhBj2YoAYMoVQ5u/lkbP6CREU2gq4i87acmBEbQPhhMWZUZNNlzNuajxiQV8ciyQeW5ra/rdI5sg0CnNsyOVP3+lEFKWA/v+k2sWAAQGUrmk9e3MAB4/+k1LPBRfZn5RJexktQiZiqrBnfM5LZ3WT+jvmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wBmxiUYRutFlU3ee7afhKa//xGK+Zs4OI+xetOAtOwU=;
 b=B0onhfEXvk6NOJRG99oeTKDV/WZuuuWrrySfPI352srvIEKNEsMJBT4bHMeZ4/IeKn7iXbX6HFDNm06abUM/5IOXiB9g0Ke0y45r7QOjtKjYrcm9Mx/4lQQ1+B56NYu1sJGslJr+1QNRyrT6CCfOeXgYdQb9oYdSq88uVueuAR8=
Received: from PH0PR03MB6382.namprd03.prod.outlook.com (2603:10b6:510:ab::9)
 by SJ0PR03MB6375.namprd03.prod.outlook.com (2603:10b6:a03:399::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Fri, 26 Aug
 2022 16:15:57 +0000
Received: from PH0PR03MB6382.namprd03.prod.outlook.com
 ([fe80::f43c:e017:cf9d:6830]) by PH0PR03MB6382.namprd03.prod.outlook.com
 ([fe80::f43c:e017:cf9d:6830%6]) with mapi id 15.20.5566.016; Fri, 26 Aug 2022
 16:15:57 +0000
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: Stefan Berger <stefanb@linux.ibm.com>, Stefan Berger
 <stefanb@linux.vnet.ibm.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH] tpm_crb: Avoid backend startup just before shutdown under
 Xen
Thread-Topic: [PATCH] tpm_crb: Avoid backend startup just before shutdown
 under Xen
Thread-Index: AQHYuVmn+tY4+kEOKUSKeD1m2sVnla3BTCcAgAAI9zc=
Date: Fri, 26 Aug 2022 16:15:56 +0000
Message-ID: <PH0PR03MB6382266A55B2CDB9745015D5F0759@PH0PR03MB6382.namprd03.prod.outlook.com>
References: <20220826143841.1515326-1-ross.lagerwall@citrix.com>
 <12d8f3b7-ae22-73c9-c0ab-eca403f421bb@linux.ibm.com>
In-Reply-To: <12d8f3b7-ae22-73c9-c0ab-eca403f421bb@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bb87607f-d35c-4ee6-4833-08da877e420a
x-ms-traffictypediagnostic: SJ0PR03MB6375:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZtrYhtcWENdyCZsNV+2NVASFgbQSeb9j4a5k0KUyxsJwdfQY55/BhW5BiF3vbGWYmsvp4MSAkKmOovhgVN9PJi9kfTrL8ulW5Uww2igAKK90t6CRb9DY6C4SJvEsYlV1wvQ5z5inyHfQa8rrg/gZe5ECPhCDXSIBr2psVdTKw+Hgwsa2tg1M1VP+OUL0NqOuFxY8jop6FdjTV1vTJPL6YggGb+bHI2ji61LrziqSXfo/QUy4uXdoPb43ELBtm7jN1q/ZN87zlpNU9Gf+rhnqAlygldJLZ0EbsZynj1MrQC6ucEfB1K74Tb1PYicpapVSv5/SZvXUT/reyIfsss5SCqYQU7+WyJgo/5oDjKDsybm+6AwSAT1EfphmMipGEwFKaapLhfK16rGb5REJ9CFzqWKVu0bxzmA9YwfwJpzNfwgWLSTYidL2eTg6TfdcTCp+bgp/J5+wPezfaXjDuxKzNV7RazF34YF+hQVW5anMsJzJN5vgQ4wLQsKg46WSJ86l73N7O+HZoAITiJzzoyop50k+2fWwVjhsXE7nizYvmeWokPTU9TLBZRP9SIrvahgngGxxXMdYNv2xgQiJjZJwpnp/CcaV3vwMif7kymHhBFYuPBwlVHDCzMcUEw4u/SpNsiZMMSsiiXMl0Dcsmq+RayNfOkdVgGwWGeAFZAmhtUZE9v9JnrlcDd4aJADLS0x1SFFOZ5gXnjbZN54hjx0RPBXiKVJ1Vax0sW5sSztwGpDtaIR4BbtfjZN5qOoI1K6soskbVu6cBzS9BGy2dxysV0JJQN11WxZaSRXuRyI5ciiY2VOGokDI75rvbjeK2kuQ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR03MB6382.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(366004)(39860400002)(136003)(376002)(396003)(53546011)(7696005)(6506007)(33656002)(26005)(2906002)(9686003)(186003)(83380400001)(86362001)(38070700005)(55016003)(38100700002)(82960400001)(478600001)(5660300002)(122000001)(41300700001)(110136005)(66556008)(64756008)(91956017)(66476007)(66446008)(8676002)(4326008)(66946007)(76116006)(52536014)(8936002)(316002)(71200400001)(44832011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?uTXWWAM0oJj0GsF8BufTJn3J1wnPFuPOJknavBqHVxCYF96f72u18HzPj1?=
 =?iso-8859-1?Q?DHqtWtid4mnfKaDjzUCTf5MDuR+BqJYAxV7wtINPwfG24buzremG2mQhyn?=
 =?iso-8859-1?Q?AfPwjVzIQCcrL3uFusCqbepEBHATUf7VNiuC59ZcZb9iL8p/nd0PbFl9xC?=
 =?iso-8859-1?Q?mq8p2H5I+q90WvRPrZqOm82b7+ztJjAfJawaqETIrQitbpXsThevCVRRbN?=
 =?iso-8859-1?Q?c3Xv+Zsnd8cKR5vVnw09pTeaAMWnOCW5czG4ebdl777F75Ecdd3Nwu0KT1?=
 =?iso-8859-1?Q?vP+iMbTaIo13CKlQDg5ZDSYh7h25dDu1hfPQmi4NmYe7dxdicOG/zUpv+L?=
 =?iso-8859-1?Q?xb3LlluSQlBzIlTXMnbSkzZw2khqQm2Saa9HfJi5qpEXibu8Z0olharOfN?=
 =?iso-8859-1?Q?qlQiaJ6fU9WUyEv/UQuI0lGZHZplzyGkP0yUB4vH3As/Y7sVW/0AjBOnVi?=
 =?iso-8859-1?Q?odGJiTZGp1hDgA7eSuiZRDtUjSAJ7JGPe2+16javt48rexSDaz0PwQzn6s?=
 =?iso-8859-1?Q?dNKz3bXynbOE0IdlxtN2xgGMOaOUOUYSBibXWWRVULH6j/hio1Uo+17lXB?=
 =?iso-8859-1?Q?CXzSjuT329jtb/M+tbeT93kecejBdA1b62ww2js4yf0zGIwp2wARZRIK+w?=
 =?iso-8859-1?Q?PRqWcacVNcqNEWKRnQFZM6vPcGAtNd2t8AuOuortTGTXTbatw8nh+6zklj?=
 =?iso-8859-1?Q?XqS/iIgC1+SwRbQQpjm/QexqXptGlMpk2yIpvMK2Qlu76CW7qaiRPHGDy1?=
 =?iso-8859-1?Q?hkJuN8xodNlhnVtqfS0oumJyi5nKLy7vJMs0P4moW/1DZp7KUzdHPsjhzS?=
 =?iso-8859-1?Q?z/+53Og5nAaAbcSYo13parXqvdK94HmnhdQ1HcbY2KDFUWEzz5d/8Nn+Tq?=
 =?iso-8859-1?Q?YO7dr3Cw+B1ontdtaCupgyHEewzJreoLmaGvo1alI0mfJQai6cY8FVivAZ?=
 =?iso-8859-1?Q?vBxAruFtUrVyZ0PM/6dUdTij5+AYCNxyR7oHgkblYf5XVEY/XljBmlI+7h?=
 =?iso-8859-1?Q?bMvwqawbpD5py/LxdhQ6PkFoR+110ck9SqPUHHBlQIfVjDuN6Gj+5lcAkm?=
 =?iso-8859-1?Q?RIsUmjXcxEn5y7eTWNtmy9m0fsAd1bKncaP1WuqJHVS6YBUGCNbpnaXs+L?=
 =?iso-8859-1?Q?V6OvLt7c4M2gVaMMjaMHvbpN+bb0LQEaotUPxWxFEcii1duWwtLoW2OrlP?=
 =?iso-8859-1?Q?iNfg33Sj8u2Ov5j02vGnVuKfo9fMI7c5rMmgCCqRGONe99LmrJBOV7t5HS?=
 =?iso-8859-1?Q?yr6biaTdf7YMImghX7dMM+uY3uo8a92frLwclmU69rHoHKgic5+CepjPW5?=
 =?iso-8859-1?Q?RhJ0RQwpPPMyNH1UU/GoFpHrnUBRZfgf+0iArJs+/x8JrHgzC8bKYquPtV?=
 =?iso-8859-1?Q?1bGx3yE7M1DD71Drgup4ME9BaIFp8VPn/IPH36Qk9HGtaSHbP7VZKfriRQ?=
 =?iso-8859-1?Q?RXZAJxJSnHEQJgC8T32DDBy6YY+qljpom0ZHtdbiYMGzFti09+ZL3k/cRf?=
 =?iso-8859-1?Q?+pSfvbxa49lt5eWpVr4hyk5vTNIh6gMgSBTApxcFZNPmHb/vJ5K/V59i83?=
 =?iso-8859-1?Q?jnyMu6D5fMqSYrWGgzPOUxK7p+lQO/jpOqOqWDoEKrYgW4wP92V4wcr+xH?=
 =?iso-8859-1?Q?pPBh47fCNK9NJ842LzEyEXM2K4l4i37Ghi?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6382.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb87607f-d35c-4ee6-4833-08da877e420a
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2022 16:15:56.9320 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PM/a6GlDT0gmmFHE6piJrmIPNIxXNciCVscWMcMTS8r9jNLxQcCIVAZ/a3rjCTvlOrzDMobkfCK+yuCbQS+whOQ5qvxaSnubkBTXQ1oXux0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6375
Received-SPF: pass client-ip=216.71.145.153;
 envelope-from=prvs=230e0beed=ross.lagerwall@citrix.com;
 helo=esa2.hc3370-68.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

> From: Stefan Berger <stefanb@linux.ibm.com>=0A=
> Sent: Friday, August 26, 2022 4:20 PM=0A=
> To: Ross Lagerwall <ross.lagerwall@citrix.com>; Stefan Berger <stefanb@li=
nux.vnet.ibm.com>=0A=
> Cc: qemu-devel@nongnu.org <qemu-devel@nongnu.org>=0A=
> Subject: Re: [PATCH] tpm_crb: Avoid backend startup just before shutdown =
under Xen =0A=
> =A0=0A=
> On 8/26/22 10:38, Ross Lagerwall wrote:=0A=
> > When running under Xen and the guest reboots, it boots into a new domai=
n=0A=
> > with a new QEMU process (and a new swtpm process if using the emulator=
=0A=
> > backend). The existing reset function is triggered just before the old=
=0A=
> > QEMU process exists which causes QEMU to startup the TPM backend and=0A=
> > then immediately shut it down. This is probably harmless but when using=
=0A=
> > the emulated backend, it wastes CPU and IO time reloading state, etc.=
=0A=
> > =0A=
> > Fix this by calling the reset function directly from realize() when=0A=
> > running under Xen. During a reboot, this will be called by the QEMU=0A=
> > process for the new domain.=0A=
> > =0A=
> > Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>=0A=
> > ---=0A=
> > =0A=
> > This conditional logic is ugly. Is there a cleaner way of doing this?=
=0A=
> > =0A=
> >=A0=A0 hw/tpm/tpm_crb.c | 7 ++++++-=0A=
> >=A0=A0 1 file changed, 6 insertions(+), 1 deletion(-)=0A=
> > =0A=
> > diff --git a/hw/tpm/tpm_crb.c b/hw/tpm/tpm_crb.c=0A=
> > index 67db594c48..ea930da545 100644=0A=
> > --- a/hw/tpm/tpm_crb.c=0A=
> > +++ b/hw/tpm/tpm_crb.c=0A=
> > @@ -26,6 +26,7 @@=0A=
> >=A0=A0 #include "sysemu/tpm_backend.h"=0A=
> >=A0=A0 #include "sysemu/tpm_util.h"=0A=
> >=A0=A0 #include "sysemu/reset.h"=0A=
> > +#include "sysemu/xen.h"=0A=
> >=A0=A0 #include "tpm_prop.h"=0A=
> >=A0=A0 #include "tpm_ppi.h"=0A=
> >=A0=A0 #include "trace.h"=0A=
> > @@ -308,7 +309,11 @@ static void tpm_crb_realize(DeviceState *dev, Erro=
r **errp)=0A=
> >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 TP=
M_PPI_ADDR_BASE, OBJECT(s));=0A=
> >=A0=A0=A0=A0=A0=A0 }=0A=
> > =0A=
> > -=A0=A0=A0 qemu_register_reset(tpm_crb_reset, dev);=0A=
> > +=A0=A0=A0 if (xen_enabled()) {=0A=
> > +=A0=A0=A0=A0=A0=A0=A0 tpm_crb_reset(dev);=0A=
> > +=A0=A0=A0 } else {=0A=
> > +=A0=A0=A0=A0=A0=A0=A0 qemu_register_reset(tpm_crb_reset, dev);=0A=
> > +=A0=A0=A0 }=0A=
> >=A0=A0 }=0A=
> > =0A=
> >=A0=A0 static void tpm_crb_class_init(ObjectClass *klass, void *data)=0A=
> =0A=
> This doesn't look right also for Xen. Shouldn't it be something like this=
?=0A=
> =0A=
> =A0=A0=A0=A0 qemu_register_reset(tpm_crb_reset, dev);=0A=
> =A0=A0=A0=A0 if (xen_enabled()) {=0A=
> =A0=A0=A0=A0=A0=A0=A0 tpm_crb_reset(dev);=0A=
> =A0=A0=A0=A0 }=0A=
> =0A=
> =0A=
> We need the reset callback for VM reset.=0A=
=0A=
This patch doesn't change anything for the QEMU/KVM case which works=0A=
fine as is.=0A=
=0A=
In the Xen architecture, the guest is rebooted into a new domain which=0A=
has new instances of QEMU and swtpm. The old instances are terminated.=0A=
So during a guest reboot it doesn't make sense to have the QEMU for the=0A=
old domain call tpm_crb_reset() just as it is about to exit since it=0A=
causes swtpm to be sent CMD_INIT which causes it to needlessly=0A=
reinitialize and reload the state. Instead, the new QEMU instance=0A=
post-reboot will call tpm_crb_reset() to start the backend directly from=0A=
the realize() function, just as for the initial guest boot.=0A=
=0A=
Ross=

