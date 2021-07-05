Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C38CA3BC1C6
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 18:48:47 +0200 (CEST)
Received: from localhost ([::1]:54330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Rm2-0003IL-RE
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 12:48:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m0Rki-0002TX-8l
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 12:47:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m0Rkf-0007Zs-SO
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 12:47:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625503640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jbTw7zC2IlRIj+0IMpuRXYOZlgD70zeOMavBw00Nn1s=;
 b=eb/+AH8NOGciO6uuhytywojvNkXT0rk8uDEA9qpSzcH8zrhZxY0WV2boDxsNbKDyMyBMSu
 shH6KnDxcTDzSkysnWwjz2mPoc9GgFMr3cFdjOg7S6thbDd4sFoP1DOy2zKvR+wiCSeMhZ
 4promJkITEIjdPdLB5j0DbbDNNyXHws=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-o02LN_WLMSmgeDnc_e4AFQ-1; Mon, 05 Jul 2021 12:47:17 -0400
X-MC-Unique: o02LN_WLMSmgeDnc_e4AFQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 m31-20020a05600c3b1fb02902082e9b2132so2018085wms.5
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 09:47:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jbTw7zC2IlRIj+0IMpuRXYOZlgD70zeOMavBw00Nn1s=;
 b=KDawI945GEJdVRzCMdo0EfP8JW5mkGQO7waX6qESLHOR+116U4BfHfflRpuEVQrhK+
 wFxCRMiXWkbiGKud8sGWhFNTt5NjwI0WuL5Cbj1rYA2T74imaX57V3oME0A5N/6KvZbu
 WfpHV9ic+7S4mZ4Fsf2BZb/6kzkZzh22ajpMIkGQqUtiMl7WbaJjZCo+y1rmGaV1HMJM
 y4MiJT8MIpZIcBzDdZue1TSmESuaX19dRN6pVLxS59xWAsNa8iM+pKn5M3s+bcwtnL1i
 f3C1kuWhRAw0PITjvX1fJbP/NyeyaR6JrykIeRtidjxKELyI9vfuan2/Ytpry1L0qH0v
 H1GQ==
X-Gm-Message-State: AOAM532O7ukGUL/ysvaIQwgLeWKN1XlqIGrkNMh2VqAD4rXQ65mKALEZ
 0MGs6VMmHsx7Q5/n++Ke6WZktOMFfSRB+bldvdTQKuh6sbxcLvOasKG/GOCFGt9FeKnZamILxkR
 IKrWtq/zN0A4RwMlrSEu4tequGYF7pMeA9RU++PwhggviIuIUTKjOzDuDaOfbnKBJoG0=
X-Received: by 2002:a05:600c:4f11:: with SMTP id
 l17mr17359wmq.121.1625503636512; 
 Mon, 05 Jul 2021 09:47:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMky98N/ji2NrgNOIZr+gxJP6yYIJWFyoI8mV8XRzZxd7s5scgsBwxoWVY8IKnC1+Z2L6uTw==
X-Received: by 2002:a05:600c:4f11:: with SMTP id
 l17mr17342wmq.121.1625503636336; 
 Mon, 05 Jul 2021 09:47:16 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o18sm16274707wrv.36.2021.07.05.09.47.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jul 2021 09:47:15 -0700 (PDT)
Subject: Re: [PULL 0/2] Libslirp patches
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210529185522.78816-1-marcandre.lureau@redhat.com>
 <CAFEAcA-8DyG7iywZVi0LAiS7RZ_d3Omd2QAn1-32iTHdKR5QZQ@mail.gmail.com>
 <CAJ+F1CK-S+diFf8fGXe-Drfz6JoNSXzxzmYQ6muRuQw76TRHkA@mail.gmail.com>
 <CAFEAcA9x3w3jvbGoZ66Xs2dhgJDnkyDVnqy45tpCjYv1uq0vYQ@mail.gmail.com>
 <CAJ+F1CLxaLHgLCM=7V=uaGyBSpCMqrD-Ktn2UsiNQHf8=CWNfg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b6c0a7a7-64a8-e159-f59b-787272c28973@redhat.com>
Date: Mon, 5 Jul 2021 18:47:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CLxaLHgLCM=7V=uaGyBSpCMqrD-Ktn2UsiNQHf8=CWNfg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/06/21 17:55, Marc-André Lureau wrote:
>      > I wonder if we miss a dependency like "git-submodule-update:
>     config-host.mak" ?

Adding the dependency should work (it doesn't seem to me that it would 
add any dependency loop).

Paolo


