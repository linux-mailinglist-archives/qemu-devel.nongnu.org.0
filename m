Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5A458A6FB
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 09:25:03 +0200 (CEST)
Received: from localhost ([::1]:35522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJrhe-0000p9-0B
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 03:25:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oJreJ-0006oV-NC
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 03:21:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oJrdz-0004NI-GA
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 03:21:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659684073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1usxqLxO1k0Jfzxrxuo8UL+g/tgRgLiM6i6RWiaa1qU=;
 b=FcZZF2XQ52hI3Qk5LQ/jT5uVdcNQ+DeOG/Eq+9nUcQPGKjyhz0CAONgy5lbEs1/jWez7Vq
 FgcqkeNmgAyvpCaeZS52GCbyv1xM6l5y/U6DoXLZcpyvqci9QXC5NAeq9azPKyyWpQfwzG
 hciOyChXOmHGEKxUDKBcDl9oep+qdWo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-3tx4NM56PTOgysXw-qD5vQ-1; Fri, 05 Aug 2022 03:21:11 -0400
X-MC-Unique: 3tx4NM56PTOgysXw-qD5vQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 n30-20020a05600c501e00b003a3264465ebso3224684wmr.1
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 00:21:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=1usxqLxO1k0Jfzxrxuo8UL+g/tgRgLiM6i6RWiaa1qU=;
 b=s4DrClesHJsnMvuEEVHpfgGBzd1LNvg6O7jBFrtFBsALnwX/yi7A7CJPO3WDKeT/um
 LDoGZE1poSUghZKMHbhn2uE/cZ656y1AV/64vSgYaRnEk8SymPFOTpH/+YyjwJSgImdn
 C/0D3L2+OQO+TYdIwRxhF+xyDl76uE38Cgs+Jt72Fs/iRtKak3mxzsUg1i0XNZXL4vXN
 JS40CzT4BrEx2yTm6XsoBOWsZXTbrrNwKeDI4vetF8GazL9D3/zRvkCiOHABarD3RW6y
 LJCr7ikUXpq/KC/cVxdB/RwzYiBRA5Rb8rkIv3HNdIU+Bd7td9kgdpZhAjSQrIZ3PTGm
 p5dg==
X-Gm-Message-State: ACgBeo1jLET4j3CP23hbTX8CBS28yirTvSSO9uCfYsYsf1H/CfCCd0ci
 lxKq59zSxJV480COt/1fgcrrTvYjccSNDJeCOHcvVfe7/BRrYIwJdy3kmoxwv6CtFaUUQxjNxkA
 SblWzZlGreuVPwMQ=
X-Received: by 2002:a5d:64a6:0:b0:21f:b3b:5cc9 with SMTP id
 m6-20020a5d64a6000000b0021f0b3b5cc9mr3227936wrp.601.1659684070121; 
 Fri, 05 Aug 2022 00:21:10 -0700 (PDT)
X-Google-Smtp-Source: AA6agR56IGR8q5WoWyp7FwGU6ZLu5fFdFogX7f7+CqdBcPQQvAtd+nKpS9Y6ap/m7HxF5BcvvLtd4Q==
X-Received: by 2002:a5d:64a6:0:b0:21f:b3b:5cc9 with SMTP id
 m6-20020a5d64a6000000b0021f0b3b5cc9mr3227921wrp.601.1659684069897; 
 Fri, 05 Aug 2022 00:21:09 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-42-112-229.web.vodafone.de.
 [109.42.112.229]) by smtp.gmail.com with ESMTPSA id
 j6-20020a05600c190600b003a31b79dc0esm23361799wmq.1.2022.08.05.00.21.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Aug 2022 00:21:09 -0700 (PDT)
Message-ID: <e8eab8e6-e6a5-af95-223f-e0ca91b4d833@redhat.com>
Date: Fri, 5 Aug 2022 09:21:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: "Zhang, Chen" <chen.zhang@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Daniel P. Berrange" <berrange@redhat.com>
Cc: "stefanha@gmail.com" <stefanha@gmail.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Xie Yongji <xieyongji@bytedance.com>
References: <cover.1659403195.git.jag.raman@oracle.com>
 <MWHPR11MB00312737931679069FAAE7AB9B9D9@MWHPR11MB0031.namprd11.prod.outlook.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 0/1] Update vfio-user module to the latest
In-Reply-To: <MWHPR11MB00312737931679069FAAE7AB9B9D9@MWHPR11MB0031.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 02/08/2022 12.00, Zhang, Chen wrote:
> 
> 
>> -----Original Message-----
>> From: Qemu-devel <qemu-devel-
>> bounces+chen.zhang=intel.com@nongnu.org> On Behalf Of Jagannathan
>> Raman
>> Sent: Tuesday, August 2, 2022 9:24 AM
>> To: qemu-devel@nongnu.org
>> Cc: stefanha@gmail.com; berrange@redhat.com
>> Subject: [PATCH 0/1] Update vfio-user module to the latest
>>
>> Hi,
>>
>> This patch updates the libvfio-user submodule to the latest.
> 
> Just a rough idea, why not depends on linux distribution for the libvfio-user.so?
> It looks no libvfio-user packet in distribution's repo.
> 
> Hi Thomas/Daniel:
> 
> For the RFC QEMU user space eBPF support,
> https://lore.kernel.org/all/20220617073630.535914-6-chen.zhang@intel.com/T/
> Maybe introduce the libubpf.so as a subproject like libvfio-user.so is more appropriate?

Fair comment. I never noticed them before, but why do we have those 
submodules in the subprojects/ folder (libvduse, libvfio-user and 
libvhost-user)? ... I don't think it's the job of QEMU to ship libraries 
that a user might want to use for a certain feature, so could we please 
remove those submodules again? If someone wants to use this, they can 
compile the libraries on their own or help their favorite distribution to 
ship them as packages.

  Thomas


