Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 400D6399B48
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 09:10:10 +0200 (CEST)
Received: from localhost ([::1]:44152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lohUW-00005n-QR
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 03:10:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lohSL-0007jY-1n
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 03:07:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lohSI-0001JG-Rv
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 03:07:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622704069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fk/CbWZNmd/RgDSPQvbfSP+NWGV/dUxy74EtEH15H+Y=;
 b=MvUovN8y2ZGyaRbPwF8M/3VyVLI1yDngh5LEwk0UksRoDKu1aiTunPolh4AApCw8jNYpib
 jQy+DBrZzQekPjmbVp9W2KLg9RIWB78QcFdzg1TJV9FZ5FeUQ1n+c3jQ8auR1RsWgHikZa
 +imazCIqZCEICZnmvaMP1ff8+nvmyJQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531--eY8-zIIMW-vPu6uR3xq0A-1; Thu, 03 Jun 2021 03:07:48 -0400
X-MC-Unique: -eY8-zIIMW-vPu6uR3xq0A-1
Received: by mail-ej1-f71.google.com with SMTP id
 z1-20020a1709068141b02903cd421d7803so1577260ejw.22
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 00:07:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Fk/CbWZNmd/RgDSPQvbfSP+NWGV/dUxy74EtEH15H+Y=;
 b=e4MzPxbxvi2P9LHNXA2T/OZay7mhwKL4/UXOsYBwP+OZRRwVnxoRJokaqEfElgEENT
 oqJN0tWUkG/hBea9DfuZVc48x3O1/iy25rWtWsmvBBf/r06ado5qGD7v7mgrVjUbuC1f
 Z1O7C+HScplkFziECI/61obPfc+F0t3LReH+hTCRiFlC47rcfvDHfT0rZ7e7JFwHH2ux
 EfbGpat0DonOrT6BNMz5+dsgBp9zMI3Zk7GIjdqqc36Jjtxn3AaKDGB/jQM8Mw1RMBoB
 EfCIxBR9BYo5y7SpZ29Rdy6lyyTPzqpheaeP3KTwyJvpQLZaP1IC92ofboy/OxpAhqOp
 HeTA==
X-Gm-Message-State: AOAM530FP+r6fD8RXCRAjoqfEcWoERn+ycm37+Jmbm8GnklJoDVQYE6E
 jS1l/iyugTKQ8SDo+YNb3z5MrjIGnd8lUGnneq+iolK/yr4qAdWu1W/dqSdwDQ4cDnSaqnEsd+k
 nHFkXq8ibFHeSKio=
X-Received: by 2002:a05:6402:4394:: with SMTP id
 o20mr43352993edc.357.1622704067286; 
 Thu, 03 Jun 2021 00:07:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbQYyjUb8FfNq/hxz/kNcuQMdDpCBj3bdWDaW7mlgy2zOVossS9leYIe/MIBC7exM3bPdiMg==
X-Received: by 2002:a05:6402:4394:: with SMTP id
 o20mr43352979edc.357.1622704067129; 
 Thu, 03 Jun 2021 00:07:47 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id bh3sm1116033ejb.19.2021.06.03.00.07.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 00:07:46 -0700 (PDT)
Subject: Re: [PATCH v3 02/19] python/qmp: Fix type of SocketAddrT
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210603003719.1321369-1-jsnow@redhat.com>
 <20210603003719.1321369-3-jsnow@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1a683bfc-dc92-1740-e736-f44fb045e090@redhat.com>
Date: Thu, 3 Jun 2021 09:07:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210603003719.1321369-3-jsnow@redhat.com>
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
> In porting the qom tools, qmp-shell, etc; it becomes evident that this
> type is wrong.
> 
> This is an integer, not a string. We didn't catch this before because
> none of QEMUMonitorProtocol's *users* happen to be checked, and the
> internal logic of this class is otherwise self-consistent. Additionally,
> mypy was not introspecting into the socket() interface to realize we
> were passing a bad type for AF_INET. Fixed now.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/qmp/__init__.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


