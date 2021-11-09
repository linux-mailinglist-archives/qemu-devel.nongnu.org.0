Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B954E44B0DD
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 17:07:56 +0100 (CET)
Received: from localhost ([::1]:41938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkTf9-00080q-TX
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 11:07:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mkTcX-0004Yr-SI
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 11:05:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.151.124]:26484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mkTcU-000625-Qi
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 11:05:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636473908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ol2tEzJTGo0zfDq1pWmZ60yFe8O3Dw855VNKDuxqo8U=;
 b=MYJ3dxLfMDRVdsHTsISpPmT16N6w9jWLGdxVLEa64vO13kZQ0aRb3QtWyGdOryfftv3rpz
 6/PSQ5wM21CjYWh3CNMjHAHtULj1dxyDZjol6bln4wV4+hDa8n+KziD5YWX4xvPub5PqGI
 Cf9lKtVoCrvRKdl2DAV8r1N14VnOKcg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-SzUB3jipPvW5y2RHCydV6Q-1; Tue, 09 Nov 2021 11:05:06 -0500
X-MC-Unique: SzUB3jipPvW5y2RHCydV6Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 144-20020a1c0496000000b003305ac0e03aso1549722wme.8
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 08:05:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ol2tEzJTGo0zfDq1pWmZ60yFe8O3Dw855VNKDuxqo8U=;
 b=66Bb7gZvtFagnTDFI5AugBdAp/DCEqzs5QG/2gkcSDrXrMwtvZgvXBoz38ijP2F0Pw
 u2ZuYO5WBEBwX/+ob4DJip5akQgIgbliet/J+jcdMrB1spOoOEOTijpIRObGcA8qAIu+
 gemSlCHUQ5lbWUPM/QbLw4hJRlxG90d4EaOMRrG4FeNzWyO0WuVoKNuDS0LFp1HZxx18
 pobbRNCeqR3yzV/mGlHl2yqa7ZMyYftTgxoLPfqAUaCYJqmkGxrp26jYF8GRhJ0CzI1v
 lWSYlRIR4yak7V+q+RM03PgiKmM2GRKaL2+mdBKpnfe5wLPaCZQtA1Gw18kdYwzYBVFp
 SpzA==
X-Gm-Message-State: AOAM532D5f26qQ7Xw3MPzZg4K/0midY+mJhzN2xzlWpnjkLb4/AHHwj6
 3sSy2wyDTls8Zudp0u6BjACpFw+GYS0kSKUm+DZrK2Y9VImpDtJTXh6VOnM1iZ7kEoKfjANBBbC
 eZZMKlLWnlPVkrhQ=
X-Received: by 2002:adf:d1c2:: with SMTP id b2mr10788766wrd.114.1636473905455; 
 Tue, 09 Nov 2021 08:05:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz48K09jfTmL8yKPbRzIwYa8pJHqfXNw8saGxh3FDce9n0YLdp0oyM7qRZDh1+Q3/8qNUhs0w==
X-Received: by 2002:adf:d1c2:: with SMTP id b2mr10788662wrd.114.1636473904853; 
 Tue, 09 Nov 2021 08:05:04 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id f19sm4067814wmq.34.2021.11.09.08.05.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 08:05:04 -0800 (PST)
Message-ID: <3dc30bad-1d56-34a1-43da-6060526d389b@redhat.com>
Date: Tue, 9 Nov 2021 17:05:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] qapi: Belatedly mark unstable QMP parts with feature
 'unstable'
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20211109145559.2122827-1-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211109145559.2122827-1-armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.151.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.364, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: eblake@redhat.com, berrange@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/9/21 15:55, Markus Armbruster wrote:
> The work in merge commit e86e00a2493 lacks special feature flag
> 'unstable', because it raced with it.  Add it where it's missing.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  qapi/machine.json | 54 +++++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 45 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


