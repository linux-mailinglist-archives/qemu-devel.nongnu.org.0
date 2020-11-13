Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE36C2B17C8
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 10:10:05 +0100 (CET)
Received: from localhost ([::1]:56266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdV5p-0007tO-0L
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 04:10:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kdV51-0007Qg-8I
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 04:09:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kdV4z-0004Gs-Jc
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 04:09:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605258552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rglseQxUup9Pt9JPJfxWvp8JyCQF2rGg3pMTAIW46mk=;
 b=hUlZb7Oxovw3V+Pn0jVz3TCwhLiExvAruugUTOBERzzmUh6zxNX+pX7beE3HYxhGpxwcnt
 2tD/vxEp5QytHGSQdvY4LyPOe8iafeibFLWTrI6+kkrF+36/ucZFOmbVkHMvwZnygyTv0Q
 e7XQNNmdmqs9Gi5yALz12qabU+QbNxs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-1oMxpvlPPdSE88-wNdDetA-1; Fri, 13 Nov 2020 04:09:10 -0500
X-MC-Unique: 1oMxpvlPPdSE88-wNdDetA-1
Received: by mail-wr1-f70.google.com with SMTP id u1so3485703wri.6
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 01:09:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rglseQxUup9Pt9JPJfxWvp8JyCQF2rGg3pMTAIW46mk=;
 b=nEBHqAS5KkVjPMoP4Rx59Cl59UGR3Ydhljw7Ep3fmoGWd8kD9Nf3P760ox5WCDIBEU
 oOmnYbFGXRx2MJFfodAOSnwyRqwmysIb9jZ7MZZDeKSsPoYUbFJaUWGoh4FW6281suQG
 ojO/pZj3LioKXWMeKwg2WG2s64mlFw3f94q6XaqDQH3e6a0/ZP1JbYkkjzupAArkkjTl
 29HLmz3TngjhQhsGfgaMUpkx2RWs1BvBNTkKIuvz78nmB1pSGPHOon95IA2LfQz9343z
 zoeenzmjnMek+QJEuuoRXyaaUe0CUqKxqg4Zt2vAqQceGQQ2hps3en5/pecdnEK3LjdW
 EaIA==
X-Gm-Message-State: AOAM533mGsk+dKZEZMOovTDWom1ViDcL9yTvsoT5mivUTnkgr3xKLtSx
 8ixlOyz1+WafCwCgUjWDiuJTcbNNaIqOssiOvH8b8oX2s7Hb9L+Hqr11yDXGxsyqphOWm77AJgw
 dUv02C8UzQ89Zf/Y=
X-Received: by 2002:adf:fb12:: with SMTP id c18mr2011958wrr.99.1605258549546; 
 Fri, 13 Nov 2020 01:09:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxf39toYk7bDz20ab02rOYFTPKUHlM0x1FVjEunq+p/i0tMk8aq2eQarsrkz9FGhRoVq932XQ==
X-Received: by 2002:adf:fb12:: with SMTP id c18mr2011923wrr.99.1605258549237; 
 Fri, 13 Nov 2020 01:09:09 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id v2sm10204942wrm.96.2020.11.13.01.09.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2020 01:09:08 -0800 (PST)
Subject: Re: [PATCH 09/10] qom: Improve {qom,device}-list-properties error
 messages
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20201113082626.2725812-1-armbru@redhat.com>
 <20201113082626.2725812-10-armbru@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5501c86a-c016-ec9a-8069-96f5b0fadc76@redhat.com>
Date: Fri, 13 Nov 2020 10:09:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201113082626.2725812-10-armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 16:09:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/11/20 09:26, Markus Armbruster wrote:
> qom-list-properties reports
> 
>      Parameter 'typename' expects device
> 
> when @typename exists, but isn't a TYPE_DEVICE.  Improve this to
> 
>      Parameter 'typename' expects a non-abstract device type
> 
> device-list-properties reports
> 
>      Parameter 'typename' expects object
> 
> when @typename exists, but isn't a TYPE_OBJECT.  Improve this to
> 
>      Parameter 'typename' expects a QOM type

Silly mistake: device-list-properties and qom-list-properties are 
exchanged in the commit message.  Can be fixed without reposting.

Paolo


