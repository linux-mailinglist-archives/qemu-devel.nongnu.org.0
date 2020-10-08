Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E00287533
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Oct 2020 15:23:08 +0200 (CEST)
Received: from localhost ([::1]:60760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQVsx-0007wb-BG
	for lists+qemu-devel@lfdr.de; Thu, 08 Oct 2020 09:23:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kQVrx-0007UG-J9
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 09:22:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kQVru-0005fO-OP
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 09:22:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602163320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O3gCnGq492VL5AjT4gZM+nElRoD+zikTFoHI/DyD9O8=;
 b=BD3MF2Z+GWNoiCI3dZQoPFMJ7IZVrFJH/WvZoHHvAS3JYWsX9i6bg4yCTjpOmsWjspec1w
 oT9hKkREOAMXBpbFLXBDYwxIBJEFYTDJ9RzEqxZnrjruLTrCU9gPXth6g9ohvJHpoux7Wz
 xNojHjvxjrfHf0jWm6uwg6HJ1AWQJWg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-LPM7BMARO_6Titb0TUFUmg-1; Thu, 08 Oct 2020 09:21:59 -0400
X-MC-Unique: LPM7BMARO_6Titb0TUFUmg-1
Received: by mail-wm1-f72.google.com with SMTP id z7so3156860wmi.3
 for <qemu-devel@nongnu.org>; Thu, 08 Oct 2020 06:21:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O3gCnGq492VL5AjT4gZM+nElRoD+zikTFoHI/DyD9O8=;
 b=KoNr62U/E8Ou9otknE7nAv+GZIl9K3s4OHl6k6oxKZUESmhNcJivDIlb5eTwLG9v04
 PInIjk0LLWX5zvREsHblr9B7ujJboP0doLRjLvY9MBPWdgkK/gw605X5ue2iUW41Ss2n
 QMmqPYdmokclZujTH48LqwoIDEOhzd/Nz3mRgbmvndDucYZ9+gNjKbO27EyvtVSpzso/
 JgmmdIopNcXqRO/45wHZPIKpMiAzuNESU/3wFg3H+TmMsnED+V/Te/dd6zJ8Bh1IZybv
 SMJ9HGeL48RyGmzAajcqcL0dZYf9E8kbps4vZd0x9mcoiHSkEiQh3AToPdc3L6IEVU5k
 Npgg==
X-Gm-Message-State: AOAM5330YW//p2haGIXaUBuuqgEs1aoTSqkrbDmbL9eWrAx2jxp9JIkY
 /mDtmzD+YnqmFyDTAS25QSvMBHyse8BQbzJ5UrRCNJm6fsJKWjqXjtBfr2ztSP9NmZ0GuuMcX/u
 rB3BWOlo/QJsy/F0=
X-Received: by 2002:a5d:5312:: with SMTP id e18mr9740072wrv.95.1602163317702; 
 Thu, 08 Oct 2020 06:21:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8WuIIEsXVjkUpdEo8nsDoKGpsM5JrIuO3zoptI81AdK/ICGReQWUpkgba8ceKwfN6rj0j8Q==
X-Received: by 2002:a5d:5312:: with SMTP id e18mr9740039wrv.95.1602163317464; 
 Thu, 08 Oct 2020 06:21:57 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:bb8c:429c:6de1:f4ec?
 ([2001:b07:6468:f312:bb8c:429c:6de1:f4ec])
 by smtp.gmail.com with ESMTPSA id t4sm2472313wra.75.2020.10.08.06.21.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Oct 2020 06:21:56 -0700 (PDT)
Subject: Re: [PATCH v3 05/11] tests/qtest/qos-test: dump environment variables
 if verbose
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
References: <cover.1601655308.git.qemu_oss@crudebyte.com>
 <8d8b242f38caccd81c27125167862f4457e8a22f.1601655308.git.qemu_oss@crudebyte.com>
 <ff76657f-4da1-5131-f981-02ea975cf1a3@redhat.com> <1836979.gfKjIU19vi@silver>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <6d6247ef-94f3-3ee3-b0ad-28e870d8dc05@redhat.com>
Date: Thu, 8 Oct 2020 15:21:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1836979.gfKjIU19vi@silver>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/08 01:56:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.214, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
 Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/10/20 15:09, Christian Schoenebeck wrote:
>> But doesn't this (and patch 6 as well) break TAP output?  Using
>> g_test_message + g_test_verbose would be the best of both worlds.
> 
> If there was TAP output then yes, patches 4, 5, 6 would probably break it.
> 
> How/when is TAP output enabled? I don't see any TAP output by default.

With "--tap", but with glib 2.62 it will be enabled by default.  For
example on Fedora 32:

  $ ./test-mul64
  # random seed: R02S3efb20d48a41e1897cb761e02393c11b
  1..2
  # Start of host-utils tests
  ok 1 /host-utils/mulu64
  ok 2 /host-utils/muls64
  # End of host-utils tests

I'm okay I guess with using g_test_message on 2.62 or newer, and
assuming people don't use --tap --verbose on older versions.

Paolo

> which is inappropriate for multi-line messages as these proposed patches do.
> 
> Is that actually a real-life problem? I mean these patches only output 
> anything if --verbose CL switch is used, and I don't see any TAP output 
> enabled by default. And the --verbose CL switch is usually just used by 
> developers for debugging test case issues, isn't it?
> 
> Best regards,
> Christian Schoenebeck
> 
> 


