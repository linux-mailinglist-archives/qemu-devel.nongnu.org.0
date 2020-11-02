Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C42D2A2849
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Nov 2020 11:31:29 +0100 (CET)
Received: from localhost ([::1]:47006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZX7Y-0002zG-Hy
	for lists+qemu-devel@lfdr.de; Mon, 02 Nov 2020 05:31:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kZX3B-0008WI-DB
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 05:27:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kZX39-0003bp-W8
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 05:26:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604312815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6s7sZKwjrVBjlusaRmPZYQ0r2G5ERLZAPT8kPT4iE+4=;
 b=KGRTDMk2kCaFPWA39W3RXQ7IKpAGwKO6O0F4nG438ohz7mRnkWr/XsnMsCSDo7Yr6OvOT+
 UKLpfh3zJ8ER2Xd7gV3NkKgozlxLe3Gnj8DUirLAPL8kt2H601iqsPdbi5yaZnNDnXlVQv
 ZGDkxllv45J3lBpV+U3uDZixgLGrmhY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-kEzKXVzGMB6j6FQyf4K_Cg-1; Mon, 02 Nov 2020 05:26:53 -0500
X-MC-Unique: kEzKXVzGMB6j6FQyf4K_Cg-1
Received: by mail-wr1-f70.google.com with SMTP id i1so6234148wrb.18
 for <qemu-devel@nongnu.org>; Mon, 02 Nov 2020 02:26:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6s7sZKwjrVBjlusaRmPZYQ0r2G5ERLZAPT8kPT4iE+4=;
 b=KeCCyogU9JLKUrsPO/x7GCgLL6t7hYk8ykDKM2kybn/umW4y6rG4JMLjYcC213c8Sj
 l60I4KfNsF5Zw/wLw5WP9qssvNe46K3zCzd+cNwy9w1Z0dZYk9qPist+UdgWPfrpZXgC
 eI7ix808wLfld8mCi08+Ol/W66FFMZCMhh+bpJzvTBwjY2rKumQhwnbW9O8GEIpH90n4
 NUZoZ/fZE+kyWPcq/BlSq3K2GyGB1pUZx0cLRvKFqC9/gh2Wp/QyLudvjnawvs9dS2rT
 qQmE/m8b6V1ZNVI9kxteENErCTvvG2ckeomsuksXLuqxJW0wV+PBEchD4ZWJzrn5NCf1
 PZ+w==
X-Gm-Message-State: AOAM532U9/4CkF6f1Ba2is7f3/LgKHsFA8CF1c/XaBiaRk50txpE0dbb
 3FhIAtUSmCoPUMjwlfixXwN2qDj9CefEP3SanpgoQIE/qipZj4orz3SwbNdhvI1yh4HGe8OTE1Y
 9scw7G88zWudxVF8=
X-Received: by 2002:a1c:2087:: with SMTP id
 g129mr10698284wmg.158.1604312812563; 
 Mon, 02 Nov 2020 02:26:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwXAaIvdk/Krsl3IMvJMKG6G+51aLeIu51dR+yaAiQSX/O+yGAKLsZIBywD69g9b5eNiH96EQ==
X-Received: by 2002:a1c:2087:: with SMTP id
 g129mr10698270wmg.158.1604312812394; 
 Mon, 02 Nov 2020 02:26:52 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id j127sm15136012wma.31.2020.11.02.02.26.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Nov 2020 02:26:51 -0800 (PST)
Subject: Re: [PATCH] vhost: fix up trailing whitespace
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
References: <20201102101301.1101378-1-mst@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <dd6d907b-fe97-8c67-8676-928c0e5ef258@redhat.com>
Date: Mon, 2 Nov 2020 11:26:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201102101301.1101378-1-mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 01:33:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/2/20 11:13 AM, Michael S. Tsirkin wrote:
> Drop trailing whitespace in vhost.c
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  hw/virtio/vhost.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


