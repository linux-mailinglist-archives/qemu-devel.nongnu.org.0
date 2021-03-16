Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D25B33D685
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 16:12:12 +0100 (CET)
Received: from localhost ([::1]:52160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMBMh-0003DN-BF
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 11:12:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMBLC-0002Cl-54
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 11:10:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMBL9-0004vB-Rn
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 11:10:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615907434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AGWU5g/AAhlqwBN4+8CfjwUqPDAXz59Iwe43lf0IbnI=;
 b=TuynK/RCUJ3CvHOvIY/Ce4MEoIWd99dZvHqyjJOWsXdpGuYQJSo9PcMC4TuciVOzQH98Kt
 8bsvzBnbJC5EHCuIyZK8bvfkw9fdg3I26ddkJmmyTQD/ZE4c5sC4oAILMD8z5EZaWvDNIu
 hl+zci+ddQ750imSjdDaW3tts0JEkxc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-zYJ0XFMlNDWJBEoHDyn5Mw-1; Tue, 16 Mar 2021 11:10:32 -0400
X-MC-Unique: zYJ0XFMlNDWJBEoHDyn5Mw-1
Received: by mail-wr1-f72.google.com with SMTP id p12so14236505wrn.18
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 08:10:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AGWU5g/AAhlqwBN4+8CfjwUqPDAXz59Iwe43lf0IbnI=;
 b=Q4HP2YTAogFbV1rXYcPQGU8l+AtXiL1TZ6mjZH/dwpEtBAJV8iluJykeTvcvIZ17nu
 iS36w6KGZVZaCrS/xeWj7PjF9rI0UElZE+HP7rQRKr8cC5/tWm7FdhddlZ7SOodMSHEw
 5dJiVWbgqLyLZiLb3AfTfB0AA3+3CCn50Wgmqexh2M8lrj+1bU+gqrajuqetrXSjvQK+
 Yd/M2SE0USukQPh9Nm9iEG6AulzeIuHAl7dGNOpfw5eMsylmR01WvISCGly5BOg0hecM
 bKTxtllnQpVGTasrXIqgc5GxIox4kOJ5h1OsS7nuGWs6gmxShUOsg7KB0lU15JoBJ3fB
 wszg==
X-Gm-Message-State: AOAM5313g8h30GvEZwLlLQMGoDzqRwLpvjuijljxlZUnwX5zWdLhCUWk
 P0GuwTVRkeNlxI5mY59cFQpVpZ+3ZCWlxjpcTxqrF9BJw0N+f3aZsCnlg5Ey3XzjpGeP2E50xap
 MrSiUPk4wB9l4fNVM6qWJYesbWIsLEPsBvFEh0LU9kja04kk1q6cqQLhUHVgmE54j
X-Received: by 2002:a1c:bb89:: with SMTP id l131mr121726wmf.47.1615907431269; 
 Tue, 16 Mar 2021 08:10:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+3OhemFnk4gOFgXvGWzrMBvwuNfJQirhm2f3YtmkWYucKm8QGWpcLbRi3ohK2So9rA6K/9g==
X-Received: by 2002:a1c:bb89:: with SMTP id l131mr121705wmf.47.1615907431044; 
 Tue, 16 Mar 2021 08:10:31 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id c11sm23123240wrm.67.2021.03.16.08.10.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 08:10:30 -0700 (PDT)
Subject: Re: [PATCH v4 03/12] net: Pad short frames to minimum size before
 sending from SLiRP/TAP
To: Bin Meng <bmeng.cn@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210316120420.19658-1-bmeng.cn@gmail.com>
 <20210316120420.19658-4-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <00807237-b2b9-89a9-9844-7d3d7e8586ed@redhat.com>
Date: Tue, 16 Mar 2021 16:10:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210316120420.19658-4-bmeng.cn@gmail.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/16/21 1:04 PM, Bin Meng wrote:
> The minimum Ethernet frame length is 60 bytes. For short frames with
> smaller length like ARP packets (only 42 bytes), on a real world NIC
> it can choose either padding its length to the minimum required 60
> bytes, or sending it out directly to the wire. Such behavior can be
> hardcoded or controled by a register bit. Similarly on the receive
> path, NICs can choose either dropping such short frames directly or
> handing them over to software to handle.
> 
> On the other hand, for the network backends like SLiRP/TAP, they
> don't expose a way to control the short frame behavior. As of today
> they just send/receive data from/to the other end connected to them,
> which means any sized packet is acceptable. So they can send and
> receive short frames without any problem. It is observed that ARP
> packets sent from SLiRP/TAP are 42 bytes, and SLiRP/TAP just send
> these ARP packets to the other end which might be a NIC model that
> does not allow short frames to pass through.
> 
> To provide better compatibility, for packets sent from QEMU network
> backends like SLiRP/TAP, we change to pad short frames before sending
> it out to the other end, if the other end does not forbid it via the
> nc->do_not_pad flag. This ensures a backend as an Ethernet sender
> does not violate the spec. But with this change, the behavior of
> dropping short frames from SLiRP/TAP interfaces in the NIC model
> cannot be emulated because it always receives a packet that is spec
> complaint. The capability of sending short frames from NIC models is
> still supported and short frames can still pass through SLiRP/TAP.
> 
> This commit should be able to fix the issue as reported with some
> NIC models before, that ARP requests get dropped, preventing the
> guest from becoming visible on the network. It was workarounded in
> these NIC models on the receive path, that when a short frame is
> received, it is padded up to 60 bytes.
> 
> The following 2 commits seem to be the one to workaround this issue
> in e1000 and vmxenet3 before, and should probably be reverted.
> 
>   commit 78aeb23eded2 ("e1000: Pad short frames to minimum size (60 bytes)")
>   commit 40a87c6c9b11 ("vmxnet3: Pad short frames to minimum size (60 bytes)")
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> 
> ---
> 
> Changes in v4:
> - squash slirp/tap commits into one
> 
> Changes in v3:
> - use the pad_short_frame() helper
> 
>  net/slirp.c     | 10 ++++++++++
>  net/tap-win32.c | 10 ++++++++++
>  net/tap.c       | 10 ++++++++++
>  3 files changed, 30 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


