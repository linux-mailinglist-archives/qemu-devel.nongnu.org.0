Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F336A5CE1
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 17:12:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX2ZH-00062b-9C; Tue, 28 Feb 2023 11:11:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pX2ZD-00062S-D4
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 11:11:03 -0500
Received: from esa6.hc2706-39.iphmx.com ([216.71.137.79])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pX2ZB-0000qT-LW
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 11:11:03 -0500
X-IronPort-RemoteIP: 209.85.166.200
X-IronPort-MID: 265347394
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:IDytm6t+RNyuU0L2MxjsDzLVGOfnVO5cMUV32f8akzHdYApBsoF/q
 tZmKW+GP/2MMzCnKoh1Ot+y90NUuZTWz95hGlNk/H9gQy1E9ZOVVN+UEBzMMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+HuDgNyo4GlD5gZkNagR1LPjvyJ94Kw3dPnZw0TQH9E88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IPM0SQqkEqSh8ai87XAMEhhXJ/0F1lqTzQJ
 OJl7vRcQS9xVkHFdX90vxNwSkmSNoUfkFPLzOTWXWV+ACQqflO1q8iCAn3aMqUD8eN5HF5f8
 sY3cjZVNDuGuca7xoqCH7wEasQLdKEHPasas3BkiDDdVLMoG8ibBarN4tBc0XE7gcUm8fT2P
 ZJIL2oyKk2ePVsVYg9/5JEWxY9EglH2dy1epEi9r7dx7mTOpOB0+OKzbYGJJYfbGa25mG6bm
 nL8o2apLCgwLeG67TeIrVCxtsjAyHaTtIU6UefQGuRRqESew3FWBBAIWF+Tp/6/hUijHdVFJ
 CQpFjEGqKEz8AmqSoC4UUfg+DiLuRkTX9cWGOo/gO2Q9pfpD8+iLjBsZlZ8hBYO65doLdD2/
 jdlR+/UOAE=
IronPort-HdrOrdr: A9a23:KxjyG6PyZbsax8BcTv2jsMiBIKoaSvp037BL7SpMoHluGfBw+P
 rCoB1273PJYU8qKRYdcLK7WZVoMEmyyXcd2+B4AV7FZmnbUQCTQr2Kg7GSpgHIKmnT8fNcyL
 clU4UWMqyVMbGit7eY3OBvKadD/OW6
Received: from mail-il1-f200.google.com ([209.85.166.200])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Feb 2023 11:07:20 -0500
Received: by mail-il1-f200.google.com with SMTP id
 d6-20020a92d786000000b00316f1737173so6282286iln.16
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 08:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Vds6DTW0duywbx7cAd0VQe+shLowhH725fSlkzHy1ic=;
 b=Hshay1+aRBCuFqXANTYTmTzMA7Q3tB50uWXXH+cxoFnZkZYVvhSVuOvEFwGLLFm8Wq
 lH0ZyZzcZuIFMSiBhhGM8hNQ/oOu4XhiTxmlTQadfeF8Kj7vIZGc1mF87/rpyS5EvMC+
 56rET0Ga6Cg8UJlOR7L50IZRvP8jaFxKrFGDn8qbWARw7/MSvavMMKLN0C9afOydQP9y
 s78zIRQRHnmFaEZ/YYk9xrA3Mr0bZ+y0Cu+mGA/AEMMChhZETn6KQZvmNus2H87rnh7G
 cJr6VqeuTd8QoWIe2qjkLc0uN70i0Kri4EKICM36dVbvQt1uF8Bl9sY7aXfIutSpKW60
 S63g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vds6DTW0duywbx7cAd0VQe+shLowhH725fSlkzHy1ic=;
 b=M9FPpg3/91tgWnVZHxnNUww1Ft4fx5zQQMcn5zm6ocN9CHT2QhpVATx8wEkObNiJEh
 9pYOWlxdViFSR9dNgU27Jdib/ZMZlXvGfDpRUMROgC8oJuqCRBIMeKMkXY1oMvJb6weB
 YN7W17LKf9RDPYxJ2SK+abouYIk75khxV8iAWAbVzLiMO9wzCZ4hCN9D/hikLA8sL/3C
 /MT2RZMtH3M1b+smZ0Zdy2yhCU7y50nJPtuRSm9Aa9nw5JTvDHK9jDZKBPnpzxloBopk
 nu/l98QKpP1QAzF+Mx422CoDXx1K7I/hf/BGRHcfPVyZ7m50LloMp6D+Lrr3X99IyRGK
 qCvA==
X-Gm-Message-State: AO0yUKVIyq0GWLuji50hfuqiMfXJE7Khaeml7nL7GqPDc8FXnwlgVVur
 TZCz60juSbhGgCqgXyR0Un0w4YTFtO2CkRRCiXRib2FDW33/VyLV+r9n/X7s+1VNDdIuQXhxOWI
 V0wrVXa/z4YvaETwf09/BaYSn2Ap4Sw==
X-Received: by 2002:a5d:8404:0:b0:74c:a9a5:2c41 with SMTP id
 i4-20020a5d8404000000b0074ca9a52c41mr2186900ion.2.1677600440224; 
 Tue, 28 Feb 2023 08:07:20 -0800 (PST)
X-Google-Smtp-Source: AK7set+MXSzCk/TtCxk2LeF8T3e2q5ssrB33eBOUrb/M/q4XpI+EwJvC/vwlT6+sVnep5tbVQrH7dg==
X-Received: by 2002:a5d:8404:0:b0:74c:a9a5:2c41 with SMTP id
 i4-20020a5d8404000000b0074ca9a52c41mr2186877ion.2.1677600439896; 
 Tue, 28 Feb 2023 08:07:19 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a92db45000000b0031599ebe3a5sm2853987ilq.32.2023.02.28.08.07.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 08:07:19 -0800 (PST)
Date: Tue, 28 Feb 2023 11:07:14 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Jon Maloy <jmaloy@redhat.com>, Siqi Chen <coc.cyqh@gmail.com>
Subject: Re: [PATCH v6 0/4] memory: prevent dma-reentracy issues
Message-ID: <20230228160714.pzb4tl2poz4beaav@mozz.bu.edu>
References: <20230205040737.3567731-1-alxndr@bu.edu>
 <20230213021141.mmzdpzj6ekmml3bx@mozz.bu.edu>
 <d2df9600-0fcb-d457-727a-90cb18d4df48@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2df9600-0fcb-d457-727a-90cb18d4df48@redhat.com>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.79; envelope-from=alxndr@bu.edu;
 helo=esa6.hc2706-39.iphmx.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999, SPF_HELO_PASS=-0.001,
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

On 230216 1214, Thomas Huth wrote:
> On 13/02/2023 03.11, Alexander Bulekov wrote:
> > ping
> 
> I think it would be really good to finally get these dma-reentrancy issues
> fixed! Who's supposed to pick up these patches? Paolo? David? Peter?

Ping

> 
>  Thomas


