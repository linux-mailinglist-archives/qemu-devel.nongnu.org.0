Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E672FD22C
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 15:08:52 +0100 (CET)
Received: from localhost ([::1]:57156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2EAF-0008Po-Vt
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 09:08:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l2E7K-0007QG-Sm
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 09:05:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l2E7H-0007im-F9
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 09:05:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611151543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dcRQbwktpz26SVN7PNe0tX1iZsVvTXLjI3vOsLZei0c=;
 b=L6sJ4ueGzruKDZZQxxPMyE+VwOC9jXmOhXnlzpKF1uUDoHgyNG7OSMrFH5wKWYR58JTcgj
 zOdEvyco4ODiILzRlGq1qASfz950pLC2n9xLA/jxdvX5UZnlHDK9KOy9wH23/cwf7fivIv
 ZijHEA7gVggOV4DO085Vi4mFBAfGOEY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-l5efEUq0OJuqJDO6p7NhMw-1; Wed, 20 Jan 2021 09:05:42 -0500
X-MC-Unique: l5efEUq0OJuqJDO6p7NhMw-1
Received: by mail-ej1-f71.google.com with SMTP id x22so7514259ejb.10
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 06:05:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dcRQbwktpz26SVN7PNe0tX1iZsVvTXLjI3vOsLZei0c=;
 b=UnVNjlg5cOj8sevcKdD6BRIhHqJlt4QZofshZNDYh00IcoX/Cg/NRMBeNb6bnhfGvN
 XdqBZbqPwbiDldajc/xFqxDpuZyF5DhabnjqjJAv1vKFb6XeP7eMN3tLv+V9jFUMhp1Q
 dVqhYTNxTEgPbCVy1n5F94f1K8acCGGy4c91YDt1HcxVxhk0thEDJmrO7KhpreSC77AM
 csGTcDfd+d605Q+KDWBO2FRRMPHMGHfD3ELGTVta7Lsb8DZ5lSfQWnKChZia7wiIJ1d1
 OYxu9iYlNHYKBMPl5NC8hH3MuYDcNjJOJ/p3kFJeEvfyesIshJjhGZf8DyBulvQUuN8z
 akSw==
X-Gm-Message-State: AOAM531Fms+14huJyFl3sFGv1XZKQ1qHR35i8JdpWYNxjsOnBuO9Wcl/
 3j61Ad+oYOrHJtQEq6InouoNiZhrD8gQATPF5q4yVWJVJVS6k1kJRXhm4wU0e2z492HuCQRa307
 AFUUd+ex6YcX4hftSmwGi98uXRf/BbAfkcb+/Lt58CPgPADrVORNm3q/ek1AU3CliOVs=
X-Received: by 2002:a17:907:3e06:: with SMTP id
 hp6mr6308710ejc.254.1611151540473; 
 Wed, 20 Jan 2021 06:05:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxdBVH6EyWz7/Ifm/2WiIKGI4lyydnk2LtTAxF4FGeJXPE6xRPdUMTK9wHrEa57TfwLBCdtXQ==
X-Received: by 2002:a17:907:3e06:: with SMTP id
 hp6mr6308688ejc.254.1611151540123; 
 Wed, 20 Jan 2021 06:05:40 -0800 (PST)
Received: from [192.168.1.124] ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id q2sm1131212edv.93.2021.01.20.06.05.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jan 2021 06:05:39 -0800 (PST)
To: Markus Armbruster <armbru@redhat.com>
References: <20210118163113.780171-1-pbonzini@redhat.com>
 <20210118163113.780171-4-pbonzini@redhat.com>
 <87o8hkx6n9.fsf@dusky.pond.sub.org>
 <99a014a0-5d9c-07d6-250a-c56e6337cf69@redhat.com>
 <878s8ovw2j.fsf@dusky.pond.sub.org>
 <06a7838d-8649-2db1-4559-2a3110eaf49a@redhat.com>
 <87ft2vsr15.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 03/25] qemu-option: warn for short-form boolean options
Message-ID: <8353a1fb-4726-4c9c-54d6-8784fbad6636@redhat.com>
Date: Wed, 20 Jan 2021 15:05:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87ft2vsr15.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: kwolf@redhat.com, imammedo@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/01/21 13:59, Markus Armbruster wrote:
>> Verbose please.   Do you think we should delay the conversion of 
>> -M/-accel/-object to keyval until 6.2?
> 
> I concurred with "it's up for discussion".  I'm happy do discuss, of
> course.

> What are the boolean parameters, and is there *any* evidence of use with
> the sugar in the wild?

There is no evidence for -machine, -accel or -object.

Notably (and for Libvirt only):

- '-object' takes a detour through JSON, and uses sometimes =on/=off or 
  sometimes =yes/=no.

- '-accel' is not used at all

- '-machine' does not use short-form boolean options by sheer luck.

The only known usage in Libvirt, for instance, is for "-chardev" and "-vnc".

Paolo


