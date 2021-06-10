Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EE43A2C31
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 14:57:01 +0200 (CEST)
Received: from localhost ([::1]:57788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrKF2-0001Dc-NP
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 08:57:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lrKE7-0008Qm-7V
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 08:56:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lrKE3-00042a-8n
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 08:56:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623329757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HsvRpgGy7CM6j7o2UXNh5ykvTCbClyQEAixHxV2igMs=;
 b=Cyntl+J9pnaeEwxCZeH9BfK5Hq9yBdqD7BQnXp2jLXC0zCdyl5bbzUEjric3NDWmQqjJnP
 +s/KYa10LZD2rzyV4aaxqSQ1vkSBb02LISEgsZWFJnc+ONqz9zD0NfMBFbuGx/nQequlnH
 1WHkMeyzOJlDcJhgCQGt3cpIAt6ka7s=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-ff69xEdnNzqHbZBN-aEbew-1; Thu, 10 Jun 2021 08:55:56 -0400
X-MC-Unique: ff69xEdnNzqHbZBN-aEbew-1
Received: by mail-wr1-f69.google.com with SMTP id
 z4-20020adfe5440000b0290114f89c9931so848608wrm.17
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 05:55:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HsvRpgGy7CM6j7o2UXNh5ykvTCbClyQEAixHxV2igMs=;
 b=SBK5B3fW9SArP58CTMfmHp1oxFWRN2KVrbsHjxBLcWDTvV+UA4D9i3WDfWTRuIZNs6
 s8NpGkkns2L1/J+Ac2Rq0VHLhr/zLmCg6HNIH9JtsLXj1X+E1PM11O33ZnBmg/eHn0GB
 sc1g8nH9SIE/lxwCUY6ctHh/fMh9TI1X1dlZ2AkmWLSiJ/RHMWJ3ldk98uJ6h0l922NU
 OL1/7gQVWtFEiayitg3+zubMVKP7YuvP/XjuuukFOYui2U6jmwiREiyIXREKRTcEu3J1
 rAvPb+1F9ikxY78OtqMOVTjkQd1RITzQh9WyN0SxvugtpurNSgfQmDYmxXmoA+F5iW+3
 eagg==
X-Gm-Message-State: AOAM532PcZCBBFks9WYc5cMNA2IYxI24gTT82qXBcGf3qHJhdOysdXdF
 nnPJt59jeMOvHNFbmWFMAJP9GbbYrdHfMHI3bDJ4OvFZafKOO4P9Y1AL2BXwE729n0c4jjlOSaA
 aYqCW1cjbIEG03J1kfvv0cVqOdvaQqs52OITWsJ3NUcuAB0wsmFy5D2fZjcyokHyyO0Q=
X-Received: by 2002:a05:600c:154:: with SMTP id
 w20mr5084632wmm.185.1623329754672; 
 Thu, 10 Jun 2021 05:55:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTSCt+9Q62E/hmBtFHOBI9f1jH3Gu682JPUB6eoxZrPFsJGk3tPIqEHy2ggz58+dm/yQ5rxQ==
X-Received: by 2002:a05:600c:154:: with SMTP id
 w20mr5084610wmm.185.1623329754400; 
 Thu, 10 Jun 2021 05:55:54 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id o26sm2778972wms.27.2021.06.10.05.55.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 05:55:53 -0700 (PDT)
Subject: Re: [PATCH] vl: Fix an assert failure in error path
To: Markus Armbruster <armbru@redhat.com>
References: <20210610084741.456260-1-zhenzhong.duan@intel.com>
 <048a18be-0d1c-7fd0-7031-51e64c5432f3@redhat.com>
 <87fsxrnss4.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <753adccc-b671-6314-2cbb-b879b8ebecc7@redhat.com>
Date: Thu, 10 Jun 2021 14:55:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <87fsxrnss4.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Zhenzhong Duan <zhenzhong.duan@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/06/21 14:09, Markus Armbruster wrote:
> Fixes: 03d2b412aaf2078425f8472f31c8a9c2340969eb

Actually 0546c0609c ("vl: split various early command line options to a 
separate function", 2020-12-10).

Done, thanks!

Paolo


