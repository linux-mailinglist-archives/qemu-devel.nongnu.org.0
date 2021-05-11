Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD53437A8B2
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 16:14:00 +0200 (CEST)
Received: from localhost ([::1]:58326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgT95-0008Et-OT
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 10:13:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lgT6b-0005iz-1C
 for qemu-devel@nongnu.org; Tue, 11 May 2021 10:11:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lgT6U-0002PO-WD
 for qemu-devel@nongnu.org; Tue, 11 May 2021 10:11:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620742277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Wghv7QG3lDZfWE2EdDPqIptRWXOrV6uUM1Syk4ZIPg=;
 b=W6i7EKSB3xfy5fbe2cCvHyuDIIdKtZyR/VgwRz6+L2RebwDnWDo6nWHYLupekw7xPKm6oE
 PqUzAYvkpMxnEqQMWXPjWO9IU7zwW3u9I/WOfGp7INTC3coMFoa2jGuQPjgHz4nw0ef+em
 BTU+pAH73dWyvCKMUAATSDcDivNbh1E=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-rR3G_74lOmiScrIi--2ISQ-1; Tue, 11 May 2021 10:11:13 -0400
X-MC-Unique: rR3G_74lOmiScrIi--2ISQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 s7-20020adfc5470000b0290106eef17cbdso8778820wrf.11
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 07:11:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3Wghv7QG3lDZfWE2EdDPqIptRWXOrV6uUM1Syk4ZIPg=;
 b=gB7ZujXzUv1GqxKDilX6jEENss+KmCfe4tJMDD8kvYu2BFUOHXSq2vjyx3P8fhDsCW
 Ayj1Q+x/jX/4ATRcwMgf4CO61dBXM344b5qmohk04cypsa4FLCfB7rzBC8ALHqE4uZdZ
 cODAL1VnKEdPyPrxt4DpOC1WroJsAKRviezBKGyXTkVB/p1uY4hqrmiccH/CdzGSutdE
 tLuOINJJOtf7hMDKhqGMBCZEPlrF4/B6pMy1L5O4Ay3Ekfz6W5VTvCFkBUqPF0qtZeHH
 5pMLIBt3/RvfzYNR/OGlNBssSHjVuC6wg3Bcw0Re5D9xfudDRlFtDrmKU7kLXHisxi51
 4Vhw==
X-Gm-Message-State: AOAM5316f0wLzPZXAgLlV077ZbYslpFxhif7fT/Hc/D2KuGMZ7Su3svu
 sSP+91YOY67ok3whJI0KRRnP+QWj1UfRbRzQKCnoiKuyCCywNqu/1uTThbT7agLhg3PZ8TQMpSf
 wh/YB25PWagO0dEs=
X-Received: by 2002:a1c:3b44:: with SMTP id i65mr5809111wma.31.1620742272551; 
 Tue, 11 May 2021 07:11:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfd0JWcrl21zNK1QvTnH2QDKX954DoUB9NrMxe+R09UojS1pYcvAOn4bLrTOjvoXl3EZrbNQ==
X-Received: by 2002:a1c:3b44:: with SMTP id i65mr5809095wma.31.1620742272405; 
 Tue, 11 May 2021 07:11:12 -0700 (PDT)
Received: from thuth.remote.csb (pd9e835ac.dip0.t-ipconnect.de.
 [217.232.53.172])
 by smtp.gmail.com with ESMTPSA id q16sm23652673wmj.24.2021.05.11.07.11.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 07:11:12 -0700 (PDT)
Subject: Re: [PATCH 10/12] bump min required glib version to 2.50
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210511132641.1022161-1-berrange@redhat.com>
 <20210511132641.1022161-11-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <8605d465-1f92-a486-7c02-c8705d905b07@redhat.com>
Date: Tue, 11 May 2021 16:11:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210511132641.1022161-11-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Willian Rampazzo <willianr@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/05/2021 15.26, Daniel P. Berrangé wrote:
> The glib version was not previously constrained by RHEL-7 since it
> rebases fairly often. Instead SLES 12 and Ubuntu 16.04 were the
> constraints in 00f2cfbbec63fb6f5a7789797a62ccedd22466ea. Both of
> these are old enough that they are outside our platform support
> matrix now.
> 
> Per repology, current shipping versions are:
> 
>               RHEL-8: 2.56.4
>       Debian Stretch: 2.50.3
>        Debian Buster: 2.58.3
>   openSUSE Leap 15.2: 2.62.6
>     Ubuntu LTS 18.04: 2.56.4
>     Ubuntu LTS 20.04: 2.64.6
>              FreeBSD: 2.66.7
>            Fedora 33: 2.66.8
>            Fedora 34: 2.68.1
>              OpenBSD: 2.68.1
>       macOS HomeBrew: 2.68.1
> 
> Thus Debian Stretch is the constraint for GLib version now.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   configure             |   2 +-
>   include/glib-compat.h |   9 --
>   util/oslib-win32.c    | 204 ------------------------------------------
>   3 files changed, 1 insertion(+), 214 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


