Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 779CB3F3373
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 20:22:44 +0200 (CEST)
Received: from localhost ([::1]:59188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH9AB-00072k-5N
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 14:22:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mH97L-0005uB-87; Fri, 20 Aug 2021 14:19:47 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:56264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mH97I-0003Xk-4o; Fri, 20 Aug 2021 14:19:46 -0400
Received: by mail-wm1-x336.google.com with SMTP id l6so257286wmq.5;
 Fri, 20 Aug 2021 11:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6GTf8G00k/lbx16Y+ydCPShh4krPLmrh308MK2m0qQo=;
 b=WlBuAjNIVPeY9y8GxcstkjFuj5UfQtM6qxvOdnGJwXTIzrTqifdxrwBz9xeOgZ7tZT
 HNwuFeSYGpbTZIKs06ALDDTiC5WIr00Zmr9/dZ/Z0VCOGgDcxAJiJ16kKGw5x9F+mvMG
 yvlwGznFdId45YRvZbrRikgGWLfGlKPkR8JZxXy3i48ByqhGey7tWbChsYzIXO770ANZ
 yLC/2jANQsjAMLcpC6p7lmIUyhSa29ofTIrO7c4QiBo6lePZcOzuxjU2iR80E7nOnjpO
 YtgOKA+PESpcFzUJY2Y+uVx/w2BUSS9NMIS/LR85Rv6e3QfTEpzWOyqDGR989Ls5JYEf
 4QmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6GTf8G00k/lbx16Y+ydCPShh4krPLmrh308MK2m0qQo=;
 b=pkeJHzTOMp0MZiwF6Ovm2xv2ck2czgl/LPuokzsxj/pEUISyAP41a/SYLzCQWJS9rU
 oTB2S4ifKSimu5u7GBoTv0SBI0J7oE6ZwffRX5RmQ1zOC8nGMNIOs+9/2nV6KXHyQvh2
 VHniwmelob0RBhAxq+ffS7ViFnmFKF3Oh5haOgjyrtruU2oY6aEzKV5pQBmgi3VXXquV
 2pNOoLm2szqmxhi4QgHB0Edvs84rGx1G3jK/qKIPjqyduw3jwLqzdgND3w1HiCjBPKNh
 oGAtP3AxIZLffQkg1kG3HD1ZOpa9e3X0G76LlRg6hEPnVxfhji3NjwEeJu+yUyOrZ0U1
 pD5A==
X-Gm-Message-State: AOAM533GP9qhRn+sj+/lQSZnDZFToC/Db++3RjgJQqmBtpRpwZTb7TX3
 vEUNgr+JHi6+HscMzbqFZGM=
X-Google-Smtp-Source: ABdhPJx6nujNbAsFA324mFQGKfQnwFDExMQwWY9lcX1rvvqrMIzPeIl7BJfzMc3LCZ4Hgu8A4zjtog==
X-Received: by 2002:a1c:1904:: with SMTP id 4mr5149358wmz.93.1629483581566;
 Fri, 20 Aug 2021 11:19:41 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id f17sm6753296wrt.49.2021.08.20.11.19.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Aug 2021 11:19:40 -0700 (PDT)
Subject: Re: [PATCH v4 0/1] hw/pflash_cfi01: Allow an administrator to reduce
 the memory consumption of flash devices
To: David Edmondson <david.edmondson@oracle.com>, qemu-devel@nongnu.org
References: <20210810134050.396747-1-david.edmondson@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0a3bdfa0-5361-5be4-fbd9-d1573b2864ab@amsat.org>
Date: Fri, 20 Aug 2021 20:19:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210810134050.396747-1-david.edmondson@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.49,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Xu Yandong <xuyandong2@huawei.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Zheng Xiang <zhengxiang9@huawei.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?B?aGFpYmluemhhbmco5byg5rW35paMKQ==?= <haibinzhang@tencent.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi David,

On 8/10/21 3:40 PM, David Edmondson wrote:
> As described in
> https://lore.kernel.org/r/20201116104216.439650-1-david.edmondson@oracle.com
> and
> https://lore.kernel.org/r/20210222174757.2329740-1-david.edmondson@oracle.com
> I'd like to reduce the amount of memory consumed by QEMU mapping UEFI
> images on aarch64.

> v4:
> - Rebase.

Sorry I haven't forgotten about your patch, I can't make room
to think quietly about your problem. I reserved a dedicated
slot of few hours next week.

