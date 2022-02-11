Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5F84B2AC8
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 17:46:34 +0100 (CET)
Received: from localhost ([::1]:58616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIZ46-0006fz-07
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 11:46:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nIZ0j-0003mi-7m
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:43:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nIZ0g-0003U0-6H
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:43:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644597781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cexP5Ux7qlc5q4ooeC0Cf7Yp0HJjLPsbf1pOG3VEESE=;
 b=Y6pvGg732eNtHxByyUYtPc6S8hXsCk4GMnSmSOrEAkoVP7bSoDHYuM+7BLVy1sMK+WKZY3
 bowsgbMzScatniFdooUkJbFbvgbCglEn4UssPGth9nNe2YXv7SHcRfbdr1ShL2Ir13/ZZU
 RSyez5LStjaGAppTzkkmoxyKuPpXcVg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-jvfMK2VpO6KbG6018BXmuQ-1; Fri, 11 Feb 2022 11:42:59 -0500
X-MC-Unique: jvfMK2VpO6KbG6018BXmuQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 13-20020a170906328d00b006982d0888a4so4307613ejw.9
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 08:42:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cexP5Ux7qlc5q4ooeC0Cf7Yp0HJjLPsbf1pOG3VEESE=;
 b=odEjFGdhr5MEsBTuwRVRigEQYnALY89lh/OhBXJp31dRM4GiqMQHReDvX4g4dOwu9S
 Q+7nensDsxTCHDm5lrrVP//GBCzvMbVRifT703QBVXjDJYj4VQ4H7MUGvPqbL3O/Nsf7
 Jx7UW3wBozMmuHBGs7NkKBu2t3eqOYzkxfREjdKXsn0jkLvyWl9a8lhHMw6GkhO2RMtO
 HE+Swgt9VMc7e3R6iwXnpMEe09sYtr8yOkdlRt4bAthKNlBWEyElA7lWxVE302XYDDWp
 UxQBA6E9VcY7OeK1PmHwial4uqEUdnEgpnMUyBCs4zX7RiMCfIURN5wS12AQWY5thHC/
 ncoQ==
X-Gm-Message-State: AOAM532VTuhakCe3WVIzpOQEnlvM6IE3TVjmZGQbNsm/zL/cARHjTEJZ
 pfPXJ7gP68quaSpkhHuTF3xVMK/fg0yeti65zDmhv/U71BHnKQPLedgrtYeOTktE32YOLjMhehL
 A/uFOnp73UuGxfIE=
X-Received: by 2002:a17:907:7f94:: with SMTP id
 qk20mr2196319ejc.328.1644597778283; 
 Fri, 11 Feb 2022 08:42:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwqCI3j47yBOVnLO4oRath1THbPFNpIVsZW6QATFc8jhYgGQKoXz7OZQ4OB2zhsWqfLkqSXzA==
X-Received: by 2002:a17:907:7f94:: with SMTP id
 qk20mr2196306ejc.328.1644597778053; 
 Fri, 11 Feb 2022 08:42:58 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id m7sm10214042edb.16.2022.02.11.08.42.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Feb 2022 08:42:57 -0800 (PST)
Message-ID: <c0415413-9692-c284-3858-a62178078ab0@redhat.com>
Date: Fri, 11 Feb 2022 17:42:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/4] Make qemu-img dd more flexible
To: Eric Blake <eblake@redhat.com>, Fabian Ebner <f.ebner@proxmox.com>
References: <20220210133123.347350-1-f.ebner@proxmox.com>
 <20220211163100.lhqrztyrr2a4akji@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220211163100.lhqrztyrr2a4akji@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
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
Cc: kwolf@redhat.com, w.bumiller@proxmox.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, aderumier@odiso.com, t.lamprecht@proxmox.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11.02.22 17:31, Eric Blake wrote:
> On Thu, Feb 10, 2022 at 02:31:19PM +0100, Fabian Ebner wrote:
>> Adds support for reading from stdin and writing to stdout (when raw
>> format is used), as well as overriding the size of the output and
>> input image/stream.
>>
>> Additionally, the options -n for skipping output image creation and -l
>> for loading a snapshot are made available like for convert.
> Without looking at the series itself, I want to refer back to earlier
> times that someone proposed improving 'qemu-img dd':
>
> https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg00636.html
> https://lists.gnu.org/archive/html/qemu-devel/2018-08/msg02618.html
>
> As well as the observation that when we originally allowed 'qemu-img
> dd' to be added, the end goal was that if 'qemu-img dd' can't operate
> as a thin wrapper around 'qemu-img convert', then 'qemu-img convert'
> needs to be made more powerful first.  Every time we diverge on what
> the two uses can do, rather than keeping dd as a thin wrapper, we add
> to our maintenance burden.
>
> Sadly, there is a lot of technical debt in this area ('qemu-img dd
> skip= count=' is STILL broken, more than 4 years after I first
> proposed a potential patch), where no one has spent the necessary time
> to improve the situation.

Note that by now (in contrast to 2018), we have FUSE disk exports, and I 
even have a script that uses them to let you run dd on any image:

https://gitlab.com/hreitz/qemu-scripts/-/blob/main/qemu-dd.py

Which is nice, because it gives you feature parity with dd, because it 
simply runs dd.

(The main problem with the script is that it lives in that personal repo 
of mine and so nobody but me knows about it.  Suggestions to improve 
that situation are more than welcome.)

Now, the qemu storage daemon does not support loading qcow2 snapshots 
(as far as I’m aware), which is proposed in patch 4 of this series.  But 
I think that just means that it would be nice if the QSD could support that.

Hanna


