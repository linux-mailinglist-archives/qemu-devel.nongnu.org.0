Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7A6607399
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 11:12:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olo4y-0002Oj-Nz
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:12:36 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olnAn-00088P-Q1
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 04:14:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olnAP-0007jW-UD
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 04:14:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olnAO-0002pd-AG
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 04:14:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666340046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M1oGuY3hYz1kP2fGJ81Oc7oOoKcRc84nCKNZWEROOKo=;
 b=PY8CL/EEpcOJpWI0qc7Jj04dgz+wecKxxRcekbIewOJNCLF9uyoxcGLFMr4jB2bUr48hMc
 BW9LiZhOnvoyEHkdpnEKkEJrnnMRIDctaJXBxdVnUwUEDzfOiAc6tKpjb7nmZCHGlN7Ijc
 Yn8x4BeeEJT3UElzLl+vgOVi9Wcr5W0=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-158-O6vL1IOyMzezxAzkzeJfRA-1; Fri, 21 Oct 2022 04:14:04 -0400
X-MC-Unique: O6vL1IOyMzezxAzkzeJfRA-1
Received: by mail-qv1-f70.google.com with SMTP id
 ma6-20020a0562145b0600b004b49a5037aeso1726371qvb.18
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 01:14:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M1oGuY3hYz1kP2fGJ81Oc7oOoKcRc84nCKNZWEROOKo=;
 b=DDdy+tcxjlX/XJS4YVEo67K8MnK0JcXQjkqj3Cy2jHWLz+zm7dG3Eu2UOrzks1yfhI
 964/8sm9uyzbPsBS/eVcKiMMrEA3/XnQ822Mr19sXc15r8ErE97ScRUWdltByeHPO9i0
 2QZNBT1dXT6iHGHaJQ9Wh0+y0LaV4hu+csBbAgqOd3VHJm+pbHpcmZpWChY0HnKtsDtK
 3AjktjihEIlk+FZ/0qDzUl+qKWanWNveL6nZ30GjAkcOCImVFt/+ZB9+Pq6GctHsdkdz
 iWGhb8Py3lyD0EBjdH3iLRCHYXyR2ZaiIzHv/nNRSjeuECyaDGHI6KmBLi8guZsVB0Jb
 +q7Q==
X-Gm-Message-State: ACrzQf3FHG9jsMSbIyKbyA6TK+F4p3wmHBwoEJBFhcdj0nHSAMAuHdJi
 KJnuhwOV5+MzTJl9yx9tNXp1Ygh/DpV5Lm5qEY1je67OaPnPiWY/EOcHgAPAcoPe9EhxFCtQjIs
 JQVtRcnDTh3biET0=
X-Received: by 2002:a05:6214:c66:b0:4b2:5ca6:8a84 with SMTP id
 t6-20020a0562140c6600b004b25ca68a84mr15316574qvj.110.1666340043924; 
 Fri, 21 Oct 2022 01:14:03 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6EslkviabCZJhy0eEKOVBAOOvIh0Y7TqQQHkO5cMXDG3L45V/wluujErL+SDw5ogHtSxfBng==
X-Received: by 2002:a05:6214:c66:b0:4b2:5ca6:8a84 with SMTP id
 t6-20020a0562140c6600b004b25ca68a84mr15316560qvj.110.1666340043675; 
 Fri, 21 Oct 2022 01:14:03 -0700 (PDT)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 x12-20020a05620a448c00b006ec5238eb97sm9314643qkp.83.2022.10.21.01.14.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Oct 2022 01:14:02 -0700 (PDT)
Message-ID: <52e989b9-6f8d-99c6-ef04-3ce32006b002@redhat.com>
Date: Fri, 21 Oct 2022 10:13:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v13 17/17] net: stream: add QAPI events to report
 connection state
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Paul Durrant <paul@xen.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Greg Kurz <groug@kaod.org>, Stefano Stabellini <sstabellini@kernel.org>,
 David Gibson <david@gibson.dropbear.id.au>, Eric Blake <eblake@redhat.com>,
 xen-devel@lists.xenproject.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Anthony Perard <anthony.perard@citrix.com>
References: <20221020162558.123284-1-lvivier@redhat.com>
 <20221020162558.123284-18-lvivier@redhat.com> <87pmel4th4.fsf@pond.sub.org>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <87pmel4th4.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 10/21/22 07:48, Markus Armbruster wrote:
> Laurent Vivier <lvivier@redhat.com> writes:
> 
>> The netdev reports NETDEV_STREAM_CONNECTED event when the backend
>> is connected, and NETDEV_STREAM_DISCONNECTED when it is disconnected.
> 
> Use cases?

This is asked by Stefano Brivio to allow libvirt to detect if connection to passt is lost 
and to restart passt.

I have also a patch to add a "reconnect=seconds" option, but I didn't want to add it to 
this series.

> 
> Could similar event signalling be useful for other kinds of netdev
> backends?

I was wondering, but it becomes more complicated to be generic.

Thanks,
Laurent


