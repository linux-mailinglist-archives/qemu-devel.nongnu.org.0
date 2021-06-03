Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 156F7399B4F
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 09:12:38 +0200 (CEST)
Received: from localhost ([::1]:51090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lohWv-0004q0-77
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 03:12:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lohVk-0003Ap-3g
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 03:11:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lohVi-0003Zy-JG
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 03:11:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622704282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DfBLY8KrefdZCcp91e9OnvUnhbT/XlO9finG51noe0M=;
 b=bsm+OphoGU0nyrqd5YEyrNbQNPzcspkZTOOi4KetbKrcsHUr7R6Wx0acz9IHo3dXE/Oj5X
 KVV98Yk5384pKc4h7GvPKM4q/VOf+nSsnlXSOCsQ0bynOpwT8f2DDyhozo7MLGWICe0iRi
 pLvfTRVUp/r0+4aumwMDioOPiIujgHw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-6TlbdbanM9aytVEr6aWtjg-1; Thu, 03 Jun 2021 03:11:20 -0400
X-MC-Unique: 6TlbdbanM9aytVEr6aWtjg-1
Received: by mail-ed1-f69.google.com with SMTP id
 f12-20020a056402150cb029038fdcfb6ea2so2783658edw.14
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 00:11:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DfBLY8KrefdZCcp91e9OnvUnhbT/XlO9finG51noe0M=;
 b=jah6n+ED6HdZgeiIutPm4wik67g0LIGI4oaHqQ6KwS5xDeGNmlw6mA3CdxU/6jRuDO
 1mBg2hrPNBKr1DOFhWVrOBvxyeAt5Dtt/cc4Pa7XNVV2kV8DKEwxXPZH/Hi0iG3f6y/w
 nLiYtmi5/WrQMzAnfUJkKSNbxYKU2O2pRUr6QU7TdgGmsg/P49YXB5SqHX3gMNHOCQvD
 gCsc080qnp4lwy+Z4sddGzt5J6nbZxywDu95CgINcqqRLrjYXIPfdfGRI0aCB9GDwX54
 t29LyeXwYlo1U8eoonWgPoMaF9AT1N7Fq8awjCe1yG1L6WP6lVt+XqLXSuqq6LiYi6JB
 KSzw==
X-Gm-Message-State: AOAM5332+9ctQc5nJ38nHQekp0lps2EpBGkO+LFkdzG1at8OvlNw+ogY
 qH525nN772Hh9wAzD+6sSWqFFNicrJDx4Wp1iDc6htcWg8fk2joC9vGqqHU1O8wCEW4kPiuivoJ
 S8us9VMHRDdfM0Pc=
X-Received: by 2002:a17:907:789a:: with SMTP id
 ku26mr29398659ejc.411.1622704279684; 
 Thu, 03 Jun 2021 00:11:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrTaQck/exI9W8YT9erPnjPoljT+tB7nov122qADHgh3Srlv+9XiBBhWRYcFhSxifxu8TYvw==
X-Received: by 2002:a17:907:789a:: with SMTP id
 ku26mr29398634ejc.411.1622704279385; 
 Thu, 03 Jun 2021 00:11:19 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id jt11sm1105392ejb.83.2021.06.03.00.11.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 00:11:19 -0700 (PDT)
Subject: Re: [PATCH v3 19/19] python/qmp: add fuse command to 'qom' tools
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210603003719.1321369-1-jsnow@redhat.com>
 <20210603003719.1321369-20-jsnow@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3b4483cc-a4ae-a521-b333-963b7866eb53@redhat.com>
Date: Thu, 3 Jun 2021 09:11:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210603003719.1321369-20-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Cleber Rosa <crosa@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Niteesh G . S ." <niteesh.gs@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/3/21 2:37 AM, John Snow wrote:
> The 'fuse' command will be unavailable if 'fusepy' is not installed. It
> will simply not load and subsequently be unavailable as a subcommand.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/qmp/qom.py | 14 ++++++++++++--
>  python/setup.cfg       |  1 +
>  2 files changed, 13 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


