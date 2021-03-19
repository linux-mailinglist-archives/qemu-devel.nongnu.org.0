Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A9D341ED5
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 14:53:48 +0100 (CET)
Received: from localhost ([::1]:51366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNFZS-0000LY-EI
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 09:53:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lNFJD-0006Xz-RS
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 09:37:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lNFJB-0001Jn-5s
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 09:36:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616161016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LiwhMbIVG5gvyqKt74iVQ8/atbuw8efysX4kuTiABCY=;
 b=c/RKBqIa37iSPrzfSOAuI8ur8YMhvXexgAevmM/0h7RHLXxFFheM9lm9uNNwSTf7UyWpLr
 nmEvEFxQdJ0tLLC5Hd+RK6m04xr78t12A1UOnVvgHtg4/a5j+dpzRpylq3UtpeqsWMFNT5
 NUGKsjO6QpL+zVUBoyplAaeziMIyzUo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-x2Sub9YQOuGfINs-I1WmsA-1; Fri, 19 Mar 2021 09:36:54 -0400
X-MC-Unique: x2Sub9YQOuGfINs-I1WmsA-1
Received: by mail-wr1-f70.google.com with SMTP id p12so19256400wrn.18
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 06:36:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LiwhMbIVG5gvyqKt74iVQ8/atbuw8efysX4kuTiABCY=;
 b=coIxEV9eOO/3XX1bjFWLhNmgEAhwi1YbrKWk3n7DVRfzlsQ0qZ4H+IrYfblSuAoTCv
 e66eO0jrk2QsRLgymV1XrlOcrz8s01QOqc8Fexz6yjM+sDpoXvNX1Z5qNFgcqhJSS2bU
 zGBx44FAu3BrUb3WQFCPIg9cXCXjfpEh4ZI3TjHi3iUlgqnBZkYg4Ca0bjjJrwMwk6X0
 r+mEk/KN79gt4xmx7D76I4qK+kDp3OCwSf1rchtAaoORyC764e2QWSna7VPYh8MY3U7M
 E088M2iwsyfwFa0UFuG7HegUNIZno5GLz9iBIMFZBZduJTa7B7+SuGygoO4si0JpLTmJ
 XPFA==
X-Gm-Message-State: AOAM530ImEoLxaN9fs/j78ve67jK0jNvjkf1WLhnIRWUsJMj4egJ9nqm
 amoPmqDb780fppGNFIP28Nf/V2+ZZbOwRCrja1tWfwcU5BzO4PjEPGUvCKfK7wtknhkLyFgHWq4
 p+6AaSQiilxMDYy8=
X-Received: by 2002:a05:600c:2947:: with SMTP id
 n7mr3889502wmd.61.1616161013480; 
 Fri, 19 Mar 2021 06:36:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXTNo3E1M89d2xAgj+TiJDHa1j5Fmn8wpfPd2jMM6urcYZz+H17u7ltAeGF1q9ejvBeehAYA==
X-Received: by 2002:a05:600c:2947:: with SMTP id
 n7mr3889484wmd.61.1616161013305; 
 Fri, 19 Mar 2021 06:36:53 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id 18sm6326758wmj.21.2021.03.19.06.36.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Mar 2021 06:36:52 -0700 (PDT)
Subject: Re: [PATCH v2 3/6] blockdev: with -drive if=virtio, use generic
 virtio-blk
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210319132537.2046339-1-laurent@vivier.eu>
 <20210319132537.2046339-4-laurent@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <071c389b-edc9-1d11-a114-5b85930c6ba7@redhat.com>
Date: Fri, 19 Mar 2021 14:36:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210319132537.2046339-4-laurent@vivier.eu>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/19/21 2:25 PM, Laurent Vivier wrote:
> Rather than checking if the machine is an s390x to use virtio-blk-ccw
> instead of virtio-blk-pci, use the alias virtio-blk that is set to
> the expected target.
> 
> This also enables the use of virtio-blk-device for targets without
> PCI or CCW.
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  blockdev.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>


