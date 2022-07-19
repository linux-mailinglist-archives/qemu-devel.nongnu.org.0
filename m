Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 510B757999A
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 14:05:10 +0200 (CEST)
Received: from localhost ([::1]:42016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDlyP-0000EL-C4
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 08:05:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oDluA-00052Y-E8
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 08:00:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oDlu5-0008UI-Fs
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 08:00:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658232040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m/NDLCFDyw5c7q7tl06QjHAe+MhVls/cgTFpTU8+IhY=;
 b=L4SlgrDcynnNTFNZKhtuVnoIZrv5gbM0Wf8b2GPqnq1B0iNxsLirwy9jsLUojEIDACekyI
 VDj6JjdYdEw30AKck8CwtVW0KNk4oo+pgZhB/h3gNSwo/8SBB97cfLIUqWwDtmLm8HLE5g
 vjgBJbUZ/iqNBr1ysiUymEqHwaZC1/I=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-R-4fPMdHM1ingJinN4cGNw-1; Tue, 19 Jul 2022 08:00:38 -0400
X-MC-Unique: R-4fPMdHM1ingJinN4cGNw-1
Received: by mail-qt1-f200.google.com with SMTP id
 u2-20020ac80502000000b002f94701339eso10119157qtg.13
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 05:00:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=m/NDLCFDyw5c7q7tl06QjHAe+MhVls/cgTFpTU8+IhY=;
 b=jB6S9G8KfZfVS6eUO1soKagpjG70D8kDDpOx0gnxt65AoJFbaKR2oHL6M/G1a7hYwC
 kDzC7EwUVBpn9zaJYGrltqXHOIBudPSarfcmvIfarIJcBUBxO2qv7ruSdsf7KddIzT4u
 Dlphq4FvEBQElNMT6DJMOxF1lgVa43JQekQr7aAmpBp5WucFngJsZ+JJHAD7Xt5Q8FGF
 GLQFS0ovJzcky9/MvNJquoOXhMl2LMQi2IRStZQxPSFTRjEHfGIARdhKatDwr0BmwAa8
 oG31m5mpJcdjsAJ4RJcMzjJ85skJe2Bc6mp5xx1yV5z3NGDny7J4dKu8xvbJgKHkKQ5h
 W5lQ==
X-Gm-Message-State: AJIora/aDftB4/anEOC8bGMsApRCj48kkiGuM1lHIAokn7UuLtia4uZj
 2JCTWKSYEZf28atPvuEz2Fwy7/fabna21PW2khpZDHPlUjXV6rV+tbeZ15xcU+XWNUM/z8LnGS1
 je6J69728Hy3afU8=
X-Received: by 2002:a05:622a:14cc:b0:31e:f6ef:a137 with SMTP id
 u12-20020a05622a14cc00b0031ef6efa137mr4138701qtx.606.1658232036242; 
 Tue, 19 Jul 2022 05:00:36 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v0GfSN2pAey/gJ1lKP+z6OzHXAVmFhFKkMzTPyPGMXRRBm7Ttu44g96a9DGOPrfkyT3D9COQ==
X-Received: by 2002:a05:622a:14cc:b0:31e:f6ef:a137 with SMTP id
 u12-20020a05622a14cc00b0031ef6efa137mr4138672qtx.606.1658232035964; 
 Tue, 19 Jul 2022 05:00:35 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 x20-20020a05620a0b5400b006a6ab259261sm13699159qkg.29.2022.07.19.05.00.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jul 2022 05:00:35 -0700 (PDT)
Message-ID: <8726804c-5dbc-bc27-3922-a00ae676941d@redhat.com>
Date: Tue, 19 Jul 2022 14:00:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v9 09/21] jobs: use job locks also in the unit tests
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20220706201533.289775-1-eesposit@redhat.com>
 <20220706201533.289775-10-eesposit@redhat.com>
 <b86ef36a-a82c-591e-54fe-481690a5987f@yandex-team.ru>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <b86ef36a-a82c-591e-54fe-481690a5987f@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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



Am 11/07/2022 um 15:08 schrieb Vladimir Sementsov-Ogievskiy:
> 
> That made me ask:
> 
> 1. Are all tests always run in main loop? If yes, why to protect status
> reading in test_complete_in_standby() ?
> 
> 2. Maybe, we don't need to protect anything here? Why to protect other
> things if we run everything in main loop?

I think it's still good example and practice to protect a function if it
needs to be protected and its name ends with _locked. It would just
confuse the reader if we don't protect it.

Emanuele


