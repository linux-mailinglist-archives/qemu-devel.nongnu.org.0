Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 452D033214E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 09:48:47 +0100 (CET)
Received: from localhost ([::1]:48572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJY2n-0001Qu-PM
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 03:48:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJY1E-0000uz-Gi
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 03:47:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJY1C-0004dT-8l
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 03:47:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615279624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gM3hQyynOwXiOoGwZnT1LhplZfjyC0cbnR+e1zIBFlE=;
 b=I9vGUXsk4yB2043tEgUdJcVEVYvLirQndpNrdhrfP9IJVXUuRIaM3wm3vNvtTNHAa4Stnj
 2hqf/LYmLUEYLOek+milT+CqUXmhytRy0tj90/+JCWU3HFagrBgD008tHynZXSqQsMIijD
 m58plWaIvLbxkJ03IZNg++qV9E5PS5c=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-3-N9dCf1NwiT10s6aCn3ew-1; Tue, 09 Mar 2021 03:47:02 -0500
X-MC-Unique: 3-N9dCf1NwiT10s6aCn3ew-1
Received: by mail-wm1-f72.google.com with SMTP id n17so178300wmi.2
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 00:47:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gM3hQyynOwXiOoGwZnT1LhplZfjyC0cbnR+e1zIBFlE=;
 b=bgoHCWoWBvRMloKM5bhGG48ZCTDuA1RYmOkNOOX73EbDQ/QbckGEyP2U+udkaJ4+DH
 QoC8xmoroU4PuW5SzoTPzEMKY3RTWSEYe+2uee0OcXKJxEt/yMOIK8vufgjqXGuOgaSy
 YkZHovbW5p2vaCoKfTzOGoBuBtdR+1kvh/LOOEITUm57JmUupSGoLlfQLka627+CrQoO
 HcVST3TwsRnzR7MX5wbs5z4fz6QDQ/RlK5vwQyjlbPa7JfFxroS2BgPrDvzj7hhkR4Ad
 9Pnbc/hw9KVeBOXPsWybqkrDfvpHlyBRKp8usSp7l30uMZ533Hc0MQTrSY7I2iiTRvVa
 QP2Q==
X-Gm-Message-State: AOAM532uMn+IkuZHWdRSYoFK9bttNOha59m4aXMSPT/tOIVMF9jrOO4W
 +zTHyIxThk5cCxjONppIFttLGtJ6l5vcdcyj/lPE+6WE/wgJlR891YEo4nAQxKh/UR5Vo2houmw
 Fe6H53rbfGppqHEg=
X-Received: by 2002:a05:600c:198f:: with SMTP id
 t15mr2827836wmq.8.1615279621791; 
 Tue, 09 Mar 2021 00:47:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwMqyDTbijJJV2NEdiUKS1Ga+HSedYsbr1s8XLvBZNOptn0W2BKMYYkrzghw66BcvpotvPfZw==
X-Received: by 2002:a05:600c:198f:: with SMTP id
 t15mr2827824wmq.8.1615279621633; 
 Tue, 09 Mar 2021 00:47:01 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f126sm2896303wmf.17.2021.03.09.00.47.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 00:47:01 -0800 (PST)
Subject: Re: [PATCH V2] virtio-net: calculating proper msix vectors on init
To: Jason Wang <jasowang@redhat.com>, ehabkost@redhat.com,
 marcel.apfelbaum@gmail.com, mst@redhat.com
References: <20210309042314.45817-1-jasowang@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <67f4d3b9-ed1f-f2c2-1e9f-d9558f1eff36@redhat.com>
Date: Tue, 9 Mar 2021 09:46:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210309042314.45817-1-jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: qemu-devel@nongnu.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/9/21 5:23 AM, Jason Wang wrote:
> Currently, the default msix vectors for virtio-net-pci is 3 which is
> obvious not suitable for multiqueue guest, so we depends on the user
> or management tools to pass a correct vectors parameter. In fact, we
> can simplifying this by calculating the number of vectors on realize.
> 
> Consider we have N queues, the number of vectors needed is 2*N + 2
> (#queue pairs + plus one config interrupt and control vq). We didn't
> check whether or not host support control vq because it was added
> unconditionally by qemu to avoid breaking legacy guests such as Minix.
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
> Changes since v1:
> - Fix typo in the commit log
> - Explain the magic number during vectors calculation
> ---
>  hw/core/machine.c          |  1 +
>  hw/virtio/virtio-net-pci.c | 10 +++++++++-
>  2 files changed, 10 insertions(+), 1 deletion(-)

(the patch had Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


