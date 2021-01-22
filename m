Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1406300187
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 12:29:25 +0100 (CET)
Received: from localhost ([::1]:53074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2ud2-000218-3X
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 06:29:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.purdie@linuxfoundation.org>)
 id 1l2uam-0000gn-Kl
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 06:27:04 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:45716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.purdie@linuxfoundation.org>)
 id 1l2uak-00006H-Fg
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 06:27:04 -0500
Received: by mail-wr1-x42b.google.com with SMTP id m1so4046616wrq.12
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 03:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=NsFey/xP5Urtipa0vHhnQQ+9x4aKOf8x9fwEx1pUzAs=;
 b=LEzIV94SneYQgcz2DYUVKdtovo+z7gZmQTyxBpva+SDbJZMtBSUE92MlgpoLTUT45O
 ojXnDftL91x4J63/71zPtlgSqWwG2Bs+2Rgoa+Pp0pOHulcuhLBEjY1Bk6nVHSJSS27V
 FFWw2mBx0ybMt2ZGiGrfx8+y9gIsABYyua/Lc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=NsFey/xP5Urtipa0vHhnQQ+9x4aKOf8x9fwEx1pUzAs=;
 b=l3HpvvORYp/zDAqWwq4dQ/oGXAtadQ4InH/AgJK1it4s8AmoOfVC6NbFft7efoC8nh
 XDLjlt0mXY/Zf8W7PbiALuQ1Y0KUzcss5OdCBDRGhuItsDljB0pM2Si7Ifdpu4aQmGFm
 UhneI6mRplPZQMLO8WFGD7DUcvbAgxbA0xREoZudYCW5SOzQYFXhl4xqB7oPQUtqkh0u
 1Vwx3tkK6ltpzXWMBwXEwjZqb/mekdZg49K2M0mWkBoVwF9y7cX78XKUbk3YjTI4Sc8B
 f/0rTsL7I5rycJMcCijT+W+Bsb/6VP3Zn7yoW0tzq/Bcv2R1kASp4PnCRlHxo87nbY0Z
 ytfg==
X-Gm-Message-State: AOAM5303T6JwUeHACR4kRy3rVlyknzw3gZOxNED1szXlKSdv6Vhhz9mc
 zwW3587e950UagKRC59G8ysLWw==
X-Google-Smtp-Source: ABdhPJzFhVudNDH/SERJKsQ45mnW4RQFs4kddmE2JKoKdfcZmhSETAOH3obBNvHSOXKv3K4wzrbiwQ==
X-Received: by 2002:a5d:640c:: with SMTP id z12mr4033610wru.342.1611314820865; 
 Fri, 22 Jan 2021 03:27:00 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:6d8b:661b:50ff:3a78?
 ([2001:8b0:aba:5f3c:6d8b:661b:50ff:3a78])
 by smtp.gmail.com with ESMTPSA id l20sm12740390wrh.82.2021.01.22.03.26.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 03:27:00 -0800 (PST)
Message-ID: <3eefc179e8217ef0ec52080fc003796f70b112fe.camel@linuxfoundation.org>
Subject: Re: [Qemu-devel] [PATCH v2 07/11] chardev: Let IOReadHandler use
 unsigned type
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Prasad J Pandit <ppandit@redhat.com>
Date: Fri, 22 Jan 2021 11:26:56 +0000
In-Reply-To: <20181012002217.2864-8-philmd@redhat.com>
References: <20181012002217.2864-1-philmd@redhat.com>
 <20181012002217.2864-8-philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.purdie@linuxfoundation.org;
 helo=mail-wr1-x42b.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jan Kiszka <jan.kiszka@siemens.com>, Jason Wang <jasowang@redhat.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
 Alexander Graf <agraf@suse.de>, Max Filippov <jcmvbkbc@gmail.com>,
 Michael Clark <mjc@sifive.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Alberto Garcia <berto@igalia.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Markus Armbruster <armbru@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?ISO-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Laurent Vivier <lvivier@redhat.com>, Corey Minyard <minyard@acm.org>,
 Amit Shah <amit@kernel.org>, Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, Peter Chubb <peter.chubb@nicta.com.au>,
 Zhang Chen <zhangckid@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Michael Walle <michael@walle.cc>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2018-10-12 at 02:22 +0200, Philippe Mathieu-Daudé wrote:
> The number of bytes can not be negative nor zero.
> 
> Fixed 2 format string:
> - hw/char/spapr_vty.c
> - hw/usb/ccid-card-passthru.c
> 
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Acked-by: Alberto Garcia <berto@igalia.com>

Sorry to drag up an old patch series. As far as I can see this series
was never applied. I suspect a better way of solving the issue may have
been found? If so can anyone point me at that change?

I ask since CVE-2018-18438 is marked as affecting all qemu versions
(https://nvd.nist.gov/vuln/detail/CVE-2018-18438).

If it was fixed, the version mask could be updated. If the fix wasn't
deemed worthwhile for some reason that is also fine and I can mark this
one as such in our system. I'm being told we only need one of the
patches in this series which I also don't believe as I suspect we
either need the set or none of them!

Any info would be most welcome.

Cheers,

Richard






