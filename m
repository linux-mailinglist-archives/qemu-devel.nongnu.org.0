Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DC130C751
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 18:17:22 +0100 (CET)
Received: from localhost ([::1]:46034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6zIn-0005oz-Mk
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 12:17:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l6zGd-0004IY-Qg
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:15:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l6zGW-0003tB-JV
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:15:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612286098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8k8Qdfyg9SP7V9pPvp76NmJ0MxSzr/rfEOZHjNI4Jik=;
 b=EQjWmZqEemdoJ2qAEeFvqfM/pNjGFwbWGV/Z9aiCMLybqt8wYdiCTn7t645V71Gs13OFaa
 TkZj8fcQYXEQnUCZ7POMDMeVfe+pjUOppIaJEItPEVigMKItMSzAd7yGGt6Izdf4+gerKz
 CXXyxsu9p9hhb2ngqIIpTul/v902Tv4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-18jCmn10PRyXkI-lBss8aQ-1; Tue, 02 Feb 2021 12:14:53 -0500
X-MC-Unique: 18jCmn10PRyXkI-lBss8aQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE7671F766;
 Tue,  2 Feb 2021 17:14:38 +0000 (UTC)
Received: from [10.3.112.103] (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D1D65D749;
 Tue,  2 Feb 2021 17:14:38 +0000 (UTC)
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
References: <CAFEAcA88wwwK5RYDpkQ+KEGwS5Qon6wQc8UsuWjjkKtKM9egcA@mail.gmail.com>
 <YBjg7ubtbw3OeQCd@SPB-NB-133.local>
 <6d360ded-f8b6-d08b-b4fc-af8c52554a58@redhat.com> <4581723.kQ5iP5sz2Z@silver>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: macOS (Big Sur, Apple Silicon) 'make check' fails in
 test-crypto-tlscredsx509
Message-ID: <2aa107b3-b986-0788-4d2d-fcd90ad891a4@redhat.com>
Date: Tue, 2 Feb 2021 11:14:37 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <4581723.kQ5iP5sz2Z@silver>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Stefan Weil <sw@weilnetz.de>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/2/21 10:35 AM, Christian Schoenebeck wrote:

>>> I've submitted the issue to Apple bugtracker:
>>> FB8986815
>>
>> Yes, it's annoying that as compilers get smarter, it exposes the
>> presence of unspecified code in weird ways.  But I don't see this as a
>> bug in clang, but as a bug in libtasn1 for assuming undefined behavior
>> produces a sane result.
> 
> You are right Eric, but nevertheless it's a very aggressive behaviour change 
> being introduced way too silent, especially regarding backward compatibility 
> like this case proofs.
> 
> Personally I find the new semantic NULL + n == NULL makes sense, as it adds 
> safety, but I do consider it a bug that clang did not even throw a warning. 
> Even when I add -Wnull-pointer-arithmetic it does not complain to me at all.

Yes, you do have a valid argument: any compiler that is going to
optimize on our undefined behavior, but fails to give us a -Wxyz option
to ferret out those spots in our code in order to avoid them in the
first place, has a poor QoI, and it is worth filing a bug against that
compiler to have it not be so silent.  Or put another way, there is a
subtle difference between arguing that "the compiler is miscompiling my
program" (which is demonstrably false per the standard's permission for
the compiler to do whatever it wants on undefined code, but if true
would represent a regression) and "the compiler is not helping me
eradicate undefined behavior from my dusty-deck code" (which is
demonstrably true), and the latter is definitely worthy of being
designated a clang bug (but not regression, rather, you just got lucky
that your code previously did what you wanted in spite of its
undefinedness).  And that applies whether or not we also pursue the
parallel course of action of fixing the actual undefined-code bug in
libtasn1 that triggered this discussion.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


