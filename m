Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4205A305D
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 22:16:38 +0200 (CEST)
Received: from localhost ([::1]:32964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRfkr-0006IH-DZ
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 16:16:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRfie-0004Gf-1a
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 16:14:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRfib-0005Kq-K0
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 16:14:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661544856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JEa6NEQOXvTXuoJpe9FzZBs/Nb96h+VM5m3810IlStk=;
 b=fDKpn8pouyxBiD7Dyz2sUaOS7b2yq7zNWMOUhVuBhm3JvRU+3hWWVTU0JlbmyMgGyVx2xm
 F6ByfeqBg6U6AufB+Ta1VYfX3rOK9y2JwCjowiFCBT0QYsWmICq7mq4lq09iKY822+Upr/
 szDRKw7gWmDFqUzoubpOYFt7Ju+i4yQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-157-CX8_ABnsMJe-yoQAg42zeg-1; Fri, 26 Aug 2022 16:14:15 -0400
X-MC-Unique: CX8_ABnsMJe-yoQAg42zeg-1
Received: by mail-wr1-f69.google.com with SMTP id
 w2-20020adfbac2000000b00225688186e5so329309wrg.8
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 13:14:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=JEa6NEQOXvTXuoJpe9FzZBs/Nb96h+VM5m3810IlStk=;
 b=ZwwutB3m5Xqe5PW2suGeuJfIJhw0NvBy8EmXgJbV97AvI6zovFPEJFyk4ojvyyweHd
 9paLimQ5wx6WGMRWsJw7kLPDNXhtGlOpy6bb/5dYsuhy9o0WzrgSrw6IQrIFkZftJIdN
 G4OBQBFiA+A8lg08ACAieee9ETbL0avX2mrqUCSSsopPpA21QBf/QUZdZ9wZkjW8tnt7
 +oz74m/Cu/beGBmxNTAGJzCEJ/96AD8Kk/Pj/uVWCQaidK7kqwjfgcM63VDjSEoLBeOR
 3JHMgFWtyALT3d/eB3nMQLnX1iwNJE6eoLX8SYyQX3jlChyUKFzO8kj7TF+82TDZj2s7
 NRyg==
X-Gm-Message-State: ACgBeo2/cI8U1CSTe4IiVsd90FwP9u4UWaw0UBZ6q3EedyLSmYPQ4Fwg
 rDCYdEHfpn68kpmNQVaujmSm83GSLAjkEHwaWnNAXv/dQmN0xrWS9OITVjB5F4YEctuBauNSi4p
 ZUUWCyDP1dt+uM50=
X-Received: by 2002:a05:6000:1c5:b0:225:4b87:6556 with SMTP id
 t5-20020a05600001c500b002254b876556mr677654wrx.79.1661544854485; 
 Fri, 26 Aug 2022 13:14:14 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5wKKkI9PMaEH5T79/0v7CiU1fst4NCNQx+rnG//RpCmBZDSMzC3D7rbsdCvt+Bi8PzWEINGA==
X-Received: by 2002:a05:6000:1c5:b0:225:4b87:6556 with SMTP id
 t5-20020a05600001c500b002254b876556mr677641wrx.79.1661544854325; 
 Fri, 26 Aug 2022 13:14:14 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-60.customers.d1-online.com.
 [80.187.98.60]) by smtp.gmail.com with ESMTPSA id
 v7-20020adfe287000000b002250f9abdefsm597650wri.117.2022.08.26.13.14.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 13:14:14 -0700 (PDT)
Message-ID: <f6f70cb4-c66a-6ae6-2a77-65ef4144222e@redhat.com>
Date: Fri, 26 Aug 2022 22:14:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 09/25] tests/docker: flatten debian-powerpc-test-cross
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220826172128.353798-1-alex.bennee@linaro.org>
 <20220826172128.353798-10-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220826172128.353798-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On 26/08/2022 19.21, Alex Bennée wrote:
> Flatten into a single dockerfile. We really don't need the rest of the
> stuff from the QEMU base image just to compile test images.

Fair point. I wonder whether the image also loads faster this way? Anyway:

Reviewed-by: Thomas Huth <thuth@redhat.com>



