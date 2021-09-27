Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF76418FAC
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 09:06:52 +0200 (CEST)
Received: from localhost ([::1]:49280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUkix-0004T6-Ew
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 03:06:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mUkhn-0003nf-36
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 03:05:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mUkhk-0006UO-IK
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 03:05:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632726335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BVQ6zu4QY47K6PthGpGHBmifKAlYmIBnBfu6H5FHpXg=;
 b=KYNqhSOyB27xTtgTT66kpTR9H/uRQtoUNTNPHOjv0tLjWCRKlcJ+fikxPSeVpEWxN6Y+Vj
 nju3zCMwMZ0vc44fUMZV84dam6fXLGW/KpzQSS1PbdlQ3X97o4mwsJwmEalsW2STDL49AN
 F9+d8xdI8DWplxwzPc0+F26vvzFlqjg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-HPylXqCIPYaaLgAj7XDnBw-1; Mon, 27 Sep 2021 03:05:33 -0400
X-MC-Unique: HPylXqCIPYaaLgAj7XDnBw-1
Received: by mail-wr1-f70.google.com with SMTP id
 p12-20020a5d4e0c000000b001605e330b62so3668831wrt.5
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 00:05:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BVQ6zu4QY47K6PthGpGHBmifKAlYmIBnBfu6H5FHpXg=;
 b=KUgziOJEW+GKD9OebqQp78/IUn+MwE4lJok34LoBg/QmQdg1jcYMVGaOwXCYxA+Qip
 deFbA0gEJT8Oa01baxZ+d4SemffjM0+mhBN2Yei3oMU0e7/zYAypYAvoMs5S1eR3GTzd
 NcwjoqIjgPeVCuNOQJ7PErS9PZ9m9YF1vlat7XeBOmiLPpXGF3sLcaEQSuImcEYeITEP
 IgYabL/brCX2nj2IpBeDxKiJbNroIyKl6AWHw1m7/D5vQ1deJNxWyEZyaZdzjA8HbeZo
 vt6iIKMyK1RC7aprDXOPwTbGT/u+P+vUsxOctL5EDV/N9EDqed4r/Q68xPVWY9xu5No2
 529Q==
X-Gm-Message-State: AOAM531QXyDlmnIplxsgpHrrRBbRidN1ZDjI61hQIAuiLBiJ3eTevKJd
 3lDz3owC3pLpY5DgrBYlk6MSuW6HzSz/GFGn/1nhqNgv0TFAWy4e7iIOfBg4onbo10Z2A4R4aan
 N61Q5X8OObRgugBA=
X-Received: by 2002:a7b:cb49:: with SMTP id v9mr13856820wmj.76.1632726332470; 
 Mon, 27 Sep 2021 00:05:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCckzjnZQn338laSkd0/RD3tlR3GueyXlRVWs97GgEPQtXWIgqVx7BctqXe5P1nPjbXeQcCw==
X-Received: by 2002:a7b:cb49:: with SMTP id v9mr13856783wmj.76.1632726332222; 
 Mon, 27 Sep 2021 00:05:32 -0700 (PDT)
Received: from thuth.remote.csb (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id k22sm16486957wrd.59.2021.09.27.00.05.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 00:05:31 -0700 (PDT)
Subject: Re: [PATCH v15] qapi: introduce 'query-x86-cpuid' QMP command.
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Valeriy Vdovin <valery.vdovin.s@gmail.com>, qemu-devel@nongnu.org
References: <20210816145132.9636-1-valery.vdovin.s@gmail.com>
 <24143eb0-9ab4-bcf7-94e7-32037ad49b2e@virtuozzo.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <02ca90a5-9f2f-4385-d5ae-8bd023b367fc@redhat.com>
Date: Mon, 27 Sep 2021 09:05:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <24143eb0-9ab4-bcf7-94e7-32037ad49b2e@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.478, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 kvm@vger.kernel.org, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Valeriy Vdovin <valeriy.vdovin@virtuozzo.com>, Denis Lunev <den@openvz.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/09/2021 09.41, Vladimir Sementsov-Ogievskiy wrote:
> Ping.
> 
> Hi! Any chance for this to land?

Sorry if I missed the outcome of the discussion - but what about the idea to 
introduce this with a "x-" prefix first, since there was no 100% certainty 
that we really fully want to support this command in the current fashion?

  Thomas



