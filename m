Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A3C6B3FEA
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 14:05:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pacQ5-0001JZ-R7; Fri, 10 Mar 2023 08:04:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pacPy-0001JG-CZ
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 08:04:18 -0500
Received: from esa7.hc2706-39.iphmx.com ([216.71.137.80])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pacPw-0000de-Hn
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 08:04:18 -0500
X-IronPort-RemoteIP: 209.85.160.200
X-IronPort-MID: 265177414
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:4+QjsK4gNZVr7rYoNM6rfgxRtIDFchMFZxGqfqrLsTDasY5as4F+v
 jEWCm+HOPnZamb8KNhxOtzlpxsHvpXdzdE3Gwpvrn81Eysa+MHIO4+lIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFu8pvlDs15K6p4GhB5gRnDRx2lAS2e0c9Xcp3yZ6ZciOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDX4pZkc/HKbitq/0Te5p0G2M80Mi+7vdkoc+dZk
 72hvbToIesg0zaldO41CnG0GAknVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2kHObNf8/pWClpLz
 tsKNBQyNBymheaflefTpulE3qzPLeHuNYIb/2h8lHTXV65+B5/ERKrO6JlT2zJYasJmR66PI
 ZpEL2MxNFKaO0Un1lQ/UfrSmM+hgmn5fydwok/TqKYqi4TW5FYvjeGyb4aMJrRmQ+11pETb5
 Tjj3l32BwMWap+W0yif03Cz07qncSTTHdh6+KeD3udnhUDWymENBRk+U1y9rv+kzEmkVLpix
 1c8/yMvqe0r6BXuQIOlB1u3p3mLuhNaUN1VewEn1DywJmPvy17xLgA5ovRpMoB63CPqbVTGD
 mO0ou4=
IronPort-HdrOrdr: A9a23:tWsHuK8NfwIeXPVeUUpuk+AEI+orL9Y04lQ7vn2ZKCYlCfBw8v
 rEoB1173HJYVoqNU3I2urwXJVoOEm8yXct2+ks1NSZLWvbUQmTXflfBOLZqlWLJ8SZzJ856U
 4KScdD4bPLYWSSwvyKhzVQvuxQpuWv4eSDv8+b5XFoVARrY6Zr40NCDBqBGEEefngkOXN8Lu
 vk2vZ6
Received: from mail-qt1-f200.google.com ([209.85.160.200])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Mar 2023 08:02:50 -0500
Received: by mail-qt1-f200.google.com with SMTP id
 z22-20020ac86b96000000b003bfc3f97097so2844780qts.14
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 05:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1678453370;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9qbwZkiSFlf9Z/CMhFOpMPLsavygBw1vKEZ/y++0F60=;
 b=MvyMEQljto9iDrs2CQdVi+hTNDwvqE2ciouBPb/i9oTyYfcSTGRtuVEfOd0nznBX1d
 xtqtVpcjjVb3NFzFb1uG5AshiDSyO3+gOMyxLiSvHgvlLwj4bVX93XbCwvX2apZ78yZE
 QYPlBPY05NsDvVjms8sMlHwibpZ2zwEZrckcnwfx89A/r+VwGGto/SvuAOB5rK9hrzZN
 vkePnqxDfBZPpdE+TJLknRk4w0nlSWcoIFRpnHTtSNrh32j0msI+V5SLwCIkEr9aRsrL
 MDqItlXy0nw1eDXtxdCFf3a3XmJ7Fh/mA0nHgpDy8bZOUUrAzHWf/1nrMyWQksM29wWT
 hbtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678453370;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9qbwZkiSFlf9Z/CMhFOpMPLsavygBw1vKEZ/y++0F60=;
 b=ziIlX4TSMWJQu6SAsZULLYdlCRLY12yPe+Sh3NvgW8b/MqeBBgFKhCu6U/tunaeepm
 iaYHSmm1HRsSTthvNA5UrXsYWRAj8Q3qSQBGkmkEY1Ovs48toPK5rfpq7t0HUWAYV3+s
 CHZmEeKveGg2MoaEySEJNezs4BWCndse3xHsQb1kzLUa+itwlXA0l1XRD5fKkHZVIQ7F
 +BOPaqAno0ZTJ+T5XlDa6Uc9rDdA1Z0XczfIYkQOrOMT1Ezfeg6njFrlsc1Innw3Rxo9
 GghJL/P3whmzMWlgwc0T7Ge2eZnoibJmNeX4/B+WHhpseqNRFKZbPVMCFA1IPa9GJc+v
 O6wA==
X-Gm-Message-State: AO0yUKUm6UXnm8FZRu8n54sf1OQhYyRCz+nmHo2ylwXM9tHcIu0tZ+iO
 i2nyYuHsNt76fvqWOWpm9FMt5133vTqbiHdAvRc7700ZvTKF4RKwv7IF871TYwxaUeW7J4MRJjM
 yjmKkMO+13fIfvaW2sXWljWSw6QnMfw==
X-Received: by 2002:a05:622a:308:b0:3b8:588c:40e9 with SMTP id
 q8-20020a05622a030800b003b8588c40e9mr11431125qtw.19.1678453370054; 
 Fri, 10 Mar 2023 05:02:50 -0800 (PST)
X-Google-Smtp-Source: AK7set8MWnBlRuW21UzD6fU/JYYwidxYrbRWr2r3sIrDOfqymmpW+k12Y0oHGcFn3YOX4MbcDWfCAw==
X-Received: by 2002:a05:622a:308:b0:3b8:588c:40e9 with SMTP id
 q8-20020a05622a030800b003b8588c40e9mr11431056qtw.19.1678453369495; 
 Fri, 10 Mar 2023 05:02:49 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 x8-20020ac87008000000b003bfb6ddc49dsm1385339qtm.1.2023.03.10.05.02.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 05:02:49 -0800 (PST)
Date: Fri, 10 Mar 2023 08:02:45 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Fiona Ebner <f.ebner@proxmox.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Jon Maloy <jmaloy@redhat.com>, Siqi Chen <coc.cyqh@gmail.com>,
 Fam Zheng <fam@euphon.net>
Subject: Re: [PATCH v6 1/4] memory: prevent dma-reentracy issues
Message-ID: <20230310130245.oyjdeihisuvgl6rz@mozz.bu.edu>
References: <20230205040737.3567731-1-alxndr@bu.edu>
 <20230205040737.3567731-2-alxndr@bu.edu>
 <9cfa0cc8-01c7-cf79-72ef-3224d1276e16@proxmox.com>
 <20230310122347.hghmijad7wajiqne@mozz.bu.edu>
 <20230310123117.d2uxze7zqtigmg44@mozz.bu.edu>
 <CAFEAcA8YLrr0Ltt-CAdTDrh2zyzzyqWgfx39fy0zJwLFqdGQGg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8YLrr0Ltt-CAdTDrh2zyzzyqWgfx39fy0zJwLFqdGQGg@mail.gmail.com>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.80; envelope-from=alxndr@bu.edu;
 helo=esa7.hc2706-39.iphmx.com
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

On 230310 1245, Peter Maydell wrote:
> On Fri, 10 Mar 2023 at 12:32, Alexander Bulekov <alxndr@bu.edu> wrote:
> > This MR seems to be "lsi-ram".
> >
> > From hw/scsi/lsi53c895a.c:
> >
> > memory_region_init_io(&s->ram_io, OBJECT(s), &lsi_ram_ops, s,
> >         "lsi-ram", 0x2000);
> >
> > So the LSI device is reading an LSI "Script" from its own IO region.. In
> > this particular case, I think there was no reason to use
> > memory_region_init_io rather than memory_region_init_ram, but this makes
> > me worried that there are other devices that use something like this.
> 
> This particular device predates the entire MemoryRegion set of
> abstractions, so it might have seemed easier at the time.
> The endianness handling of the current code is also a bit
> confusing and might make it tricky to convert to a RAM MR.

With my trivial mr_io - > mr_ram conversion, I no longer hit the
re-entrancy tracepoint, and my livecd boots, but it's probably not
exhaustively using the script functionality.. 

Does the endianness actually cause a problem? As long as all accesses
(CPU -> LSI_RAM and LSI -> LSI_RAM) occur through the address_space API,
are we safe?
-Alex

