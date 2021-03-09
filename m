Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE9033239D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 12:06:45 +0100 (CET)
Received: from localhost ([::1]:56846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJaCK-0000MT-P3
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 06:06:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJa11-0003nq-2o
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:55:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJa0t-0002mG-Fg
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:55:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615287293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GUkVWtO4wU2tLsNxibFoSMTJ0Z8k34HxCnX16WFh7XY=;
 b=V4q6wplz6uqECPRbqjFmyiAhg99R7i3fKIoakc5Dww/M74X1QfF72LG2oChocAFLJQLF9v
 WEqi87f1l1WnQC7FD/OG/6EBeKcGPyPYdhU0Q9cWsiXgu3TaJBHbSZJdbEhFVMI/CbD0ph
 rbBjsahftyYzBqqwJzAl9yppfM2Mm2k=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-chSw4_o6OaOLEXCpBZpbuQ-1; Tue, 09 Mar 2021 05:54:52 -0500
X-MC-Unique: chSw4_o6OaOLEXCpBZpbuQ-1
Received: by mail-wm1-f72.google.com with SMTP id n25so979294wmk.1
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 02:54:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GUkVWtO4wU2tLsNxibFoSMTJ0Z8k34HxCnX16WFh7XY=;
 b=sfpa1wzvWrKM2D8Ij9AsBgTZveKR9/crNPN/k+ikGXuyeeQqT8qdg8kLx7PeiRkFk3
 aYFm6MNZCGnh1a2aN7m9ycKszDN+laPMIxsS9f8TErHn+5BUiDYboF+stu7mslTjyGIG
 woKzkWwZxAOa3SJZTnR7lbrGmYXXdsZhZcP9WIcTvLTcLJ7PpESGdytHgjNx6LtGrwLK
 +aQp9aBHwxJO+WTbePLVLg8I7HI1zTLnNbsyjaQh+og3KN375buNm/CgYbJDIqZl2DDE
 2VPV2NgTYL7Xu+R8WNRxD8tdlM1tbWh4RlHx5sAMpgkfJYVcrV4fFe41U5MFhjCHirb/
 E9WQ==
X-Gm-Message-State: AOAM532rRGgj1IhjSLS8ZC2LqeSDA5Gbvh5eFLXPNt+duMjsgKTbr7nB
 4ot/3iiycVV1mahR06z/1wdUSyaYyzJO3M2GRyUpezDdtt/AC34yL8O+4WgYpCLuHanLzZZEzTa
 gMfNhxBGUCfuHZr8v5nikjDuQookq/lc10IkK6GBht82a8eIZ/So1c7vB9EHqhLkl
X-Received: by 2002:a7b:cdf7:: with SMTP id p23mr3393823wmj.26.1615287291002; 
 Tue, 09 Mar 2021 02:54:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzKrD7YAsHYcqGiGcOLd2FHJQNXIlNNEr6Fl15OcoyqC6ea0GrqTx43YuYCfUQhOTjA2XvBoQ==
X-Received: by 2002:a7b:cdf7:: with SMTP id p23mr3393800wmj.26.1615287290762; 
 Tue, 09 Mar 2021 02:54:50 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id b186sm3456418wmc.44.2021.03.09.02.54.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 02:54:50 -0800 (PST)
Subject: Re: [RFC PATCH v2] meson: Only generate trace files for selected
 targets
To: Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20210224213515.3331631-1-philmd@redhat.com>
 <YEZU4n1IW6lSQwxl@stefanha-x1.localdomain>
 <af8022d6-c729-5033-6efa-6a1ea23ebee7@redhat.com>
 <b9b3c6ac-e7c5-2f64-cc66-5303e6b9a2c4@suse.de>
 <7ff2c1ed-e6ad-4a6f-3552-be5ba90960d7@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9cf0f38a-3b9c-6f18-e5f2-9be31c708312@redhat.com>
Date: Tue, 9 Mar 2021 11:54:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <7ff2c1ed-e6ad-4a6f-3552-be5ba90960d7@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/9/21 11:26 AM, Paolo Bonzini wrote:
> On 09/03/21 09:41, Claudio Fontana wrote:
>> In any case, I agree that just recursing all directories in target/
>> looking for trace.h / traceevents files could be better.
> 
> Using the directory structure to find source files is a bad idea because
> you don't notice that you haven't "git add"ed a file until it's too late
> (typically the maintainer notices it for you...).
> 
> We do it for default-configs/targets, but that's an exception and I'd
> rather not extend it more.
> 
> In fact, Philippe, perhaps you can add the extra tracedirs for hw/ and
> target/ to the default-config/targets/*.mak file?

Hmm interesting idea... I'll have a look, thanks!


