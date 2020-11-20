Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3188D2BAAD1
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 14:08:44 +0100 (CET)
Received: from localhost ([::1]:41778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg69b-0002Oq-8M
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 08:08:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kg67u-0001pq-MN
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 08:06:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kg67t-0000cb-2J
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 08:06:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605877616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RHkmyBMVl4/NZeShoDUtlwVsYs4tZlo5QfWhHraPA28=;
 b=RLR9O4MouufD3ZzvRMSLdeJH4W7+iidyFs/3jkZx510DjzrsHKPCfl74FlfXl6tbDncJZO
 IyIOmuoeieJKsudU8OjQ1jqF3zezq6dZloafQbW9ar4WWmVWZR7k/keZ81CRBQnHBBYxVx
 O0E5qbngcXHKYW+yi5bXWqJgecNwfJ4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-ORBjwXRiNKGGzycJFZe2cw-1; Fri, 20 Nov 2020 08:06:53 -0500
X-MC-Unique: ORBjwXRiNKGGzycJFZe2cw-1
Received: by mail-ed1-f70.google.com with SMTP id d3so3726610eds.3
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 05:06:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RHkmyBMVl4/NZeShoDUtlwVsYs4tZlo5QfWhHraPA28=;
 b=F8JpBWhH1+pNtSlGIDCPdHUfwgGbkgzTxZ78OCMgOtXv/fWlPMeLSSr/FupvtTFpNA
 BeZ1x5aFymFzBMzU/HUIvZchDjvL9Qgwq7w0vrldVy4rEEb53hU67VCGFYPGjxXWYrto
 IcckW5DIVzKcHTzhEWGuUdJXHll+EfhSTlNnIrJkPIMiNNI0q7QygH4urHC0w4MerPLj
 ZjP9eXDtifyQoL+GR5F7s+29JBRWO76ZmBTDktxq7ZjcfugX15OxU/Prw/gciq9s/pbu
 zd55muFRlf58zTB/Yp7MlNSg43hel+1N/g/fvqw67QL8Mwui7OTinMEXKDaxa926Icya
 wDZQ==
X-Gm-Message-State: AOAM531dz91yrjhdDt1Ys0iDsTSDWhM9rA7Clefc0yG8yZNoLxD4Qzkf
 3S6+kBlXxw0qiCqbWr6GMYiMvneRT4wM3Ne3fZuHWof9+cnAXDsW+a3Z1ZcAf5lsuSRI9E7FW+8
 fxPNVDN1EIk3xqSf6edmIqWGtVn+bDt2254qgYO/XzgxjXN0EZkLkL4OVfEWN9kO0ekc=
X-Received: by 2002:a17:906:46d2:: with SMTP id
 k18mr31501458ejs.33.1605877611793; 
 Fri, 20 Nov 2020 05:06:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw6f0EKgYIUvitm4enQL68rHQd7Idx4rqC5V2XgE/QF8p6VpcLu3TnXzOFM/qTwYvV1cR2xYQ==
X-Received: by 2002:a17:906:46d2:: with SMTP id
 k18mr31501425ejs.33.1605877611399; 
 Fri, 20 Nov 2020 05:06:51 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id nd5sm1108836ejb.37.2020.11.20.05.06.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2020 05:06:50 -0800 (PST)
Subject: Re: [PATCH 4/4] [broken] meson: try link tracepoints to module
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <20201119084448.24397-1-kraxel@redhat.com>
 <20201119084448.24397-5-kraxel@redhat.com>
 <20201119110316.GG701869@stefanha-x1.localdomain>
 <20201119112323.3rcfmee2jm3uw3ym@sirius.home.kraxel.org>
 <20201119115514.GA838600@stefanha-x1.localdomain>
 <20201120102355.mayek7z4ud5orqme@sirius.home.kraxel.org>
 <20201120112539.bsyjsfrqxz4ffo4r@sirius.home.kraxel.org>
 <8102f2fa-1902-050d-d6c4-cd2bc80c7cb5@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b16b1992-09d7-1a28-4adb-f7fb41079df5@redhat.com>
Date: Fri, 20 Nov 2020 14:06:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <8102f2fa-1902-050d-d6c4-cd2bc80c7cb5@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/11/20 13:30, Philippe Mathieu-Daudé wrote:
> Maybe managing it all in the main meson.build, like the
> e28ab096bf8..da33fc09873 cleanup?
> ("Move the creation of the library to the main meson.build")

That was a different issue due to variables being defined in many 
different meson.build files.  But I think in this case the ordering is 
not an issue, and that's actually because of your patch. :)

Paolo


