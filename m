Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FB2351115
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 10:48:19 +0200 (CEST)
Received: from localhost ([::1]:45996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRszy-0001fr-Js
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 04:48:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vincent@bernat.ch>) id 1lRsyY-0000v4-SI
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 04:46:50 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:42793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vincent@bernat.ch>) id 1lRsyW-00027F-Vk
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 04:46:50 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 144B32E2A;
 Thu,  1 Apr 2021 04:46:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 01 Apr 2021 04:46:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bernat.ch; h=
 from:to:cc:subject:references:date:in-reply-to:message-id
 :mime-version:content-type:content-transfer-encoding; s=fm3; bh=
 p0QZwl4o35Y8qpfyuyAVhbZtvOPH/cDEDBz79eFLK94=; b=p4LLkKKIeR17jFl7
 /Im5IoHkDK4ba0p+85jXIVPYjFmsp0WjIH9V5Piccq/4oWyddPhqV5keEzY/T/mo
 +orMEKWs+v8++8O3+pNhzZrULgfHFt8bAJW284VuqSr7zAUxurKgFq1ew8960S8D
 bsDxIHIMqGzsHDK/0I2Zoy2LnjcsEWZbi30wKlpWA4vOGLHOWhw7BZvO1t/eSFwS
 SAUDchpo7dDrg0qJIL+m/fjuXdPe+9Nqfcv8FJBtCXindSLZVgsAUcTkW/AhM8mo
 GSxSwyI54/J/Sd+yJ8kv7adXep3fS8gKJG8wmiiCq/FRlGh+McXVl7vEhLuojhon
 gfXa3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=p0QZwl4o35Y8qpfyuyAVhbZtvOPH/cDEDBz79eFLK
 94=; b=q7Co8UkSnCSLlLqONBbWCUIMzV23GsRI0SCL3+scoSA4QATRJldXbsqbj
 xAs1G0JsZf5eEBN1orrzlxoLKhaGmDXEaTHTC8W8vO+1EzFV/q/was7qTwnGLY9t
 BXyCJ/4kT3PrGJ4aROp+ZkhILomfZOEze5aH4NB67PaEoWbJo7Ns5QoIdCaDwxwN
 4zbRw05aZGMexUeyKE0wJvPsrIWJlQDMh9OPxP2qtv1e3eIB4acnQsAxi/cFTyUn
 eKgZ6l/9bXulEbZTULrsf9anXynrAx9BhOSj7F9gdhgfhwiQjPv/NjgfrG45iVUI
 AePKTe8x6M5POm4vQ5lIIbviTnHEw==
X-ME-Sender: <xms:dYhlYAvZ0capC17ExaaCBeGIOjZexJAJxIdCG3y-Gm8n6elZTTWO-w>
 <xme:dYhlYE5DT4Iw7erQ0AIVOMNHrPocRdgTE0KCG_l39eFiezH-6KfpuMykX5YZP1iOa
 7AJBzXLhptdxea8fwk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeigedgtdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufhfffgjkfgfgggtgfesthekredttderjeenucfhrhhomhepgghinhgt
 vghnthcuuegvrhhnrghtuceovhhinhgtvghnthessggvrhhnrghtrdgthheqnecuggftrf
 grthhtvghrnhepudeuveeggedtveduudejgfeiffeiveduiedvjedvudefleetgfefvdfh
 kedtieejnecukfhppeeltddrledtrdeltddrfeehnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepvhhinhgtvghnthessggvrhhnrghtrdgthh
X-ME-Proxy: <xmx:dYhlYJLEnZaTaDNP3qZITIhz9xE1uQaiWI_hpzWKtXNwl_5qYM1eHA>
 <xmx:dYhlYM5hKpt6Iub5o3qvu7J7dcgcyw6HYyKGSuijM-PdFMN04GALzw>
 <xmx:dYhlYEw0NF2NVgvzmutLP9nDnbKPZXQ2rZ4mTSzoaziTHsAyhaEZZA>
 <xmx:dYhlYHAgNEBwP_fkl4xKLYqqcnda7ZRQ_3nYT-4YOWMhBJL6fB2bYQ>
Received: from neo.luffy.cx (lfbn-idf1-1-1655-35.w90-90.abo.wanadoo.fr
 [90.90.90.35])
 by mail.messagingengine.com (Postfix) with ESMTPA id 53ABB240054;
 Thu,  1 Apr 2021 04:46:45 -0400 (EDT)
Received: by neo.luffy.cx (Postfix, from userid 500)
 id 256B9A28; Thu,  1 Apr 2021 10:46:44 +0200 (CEST)
From: Vincent Bernat <vincent@bernat.ch>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v2 1/2] hw/smbios: support for type 41 (onboard devices
 extended information)
References: <20210401082544.16522-1-vincent@bernat.ch>
 <YGWHPWSrOLxEQtMA@redhat.com>
Date: Thu, 01 Apr 2021 10:46:44 +0200
In-Reply-To: <YGWHPWSrOLxEQtMA@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Thu, 1 Apr 2021 09:41:33 +0100")
Message-ID: <m31rbul7d7.fsf@bernat.ch>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.24; envelope-from=vincent@bernat.ch;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 ❦  1 avril 2021 09:41 +01, Daniel P. Berrangé:

>> +            t = calloc(1, sizeof(struct type41_instance));
>> +            if (!t) {
>> +                error_setg(errp,
>> +                           "Unable to allocate memory for a new type 41 instance");
>> +                return;
>> +            }
>
> QEMU uses GLib allocation functions throughout, which abort
> on OOM. So replace this with g_new0.

Ack. Will be fixed on the next version. Thanks!
-- 
Make input easy to proofread.
            - The Elements of Programming Style (Kernighan & Plauger)

