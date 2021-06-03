Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A50399B4C
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 09:12:00 +0200 (CEST)
Received: from localhost ([::1]:48520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lohWJ-00039O-E2
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 03:11:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lohTK-00004z-UT
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 03:08:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lohTF-0001pi-4S
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 03:08:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622704127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L4/6mIOtOdHLsx+0vZviyP3fDK7Dee4kc2xkN24Bu5w=;
 b=cJKWXw+Ylu8rIGrVKb+d3hwHl49jmNMuNl+/yvpQqHBzV67wa0UFt11vZwbU/W4eveAepk
 IrbH7InygaTdbrudaBKDNllW+Q98iA4FC01fOtJKTqnHVVd+Hq6Bjo5xYFom5GQW2JX8vF
 ySGTmsIEug87xTaOu7DPsUWqRKQR5TE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-r7eZ9nBnM8K7yv9HKzf1Rw-1; Thu, 03 Jun 2021 03:08:46 -0400
X-MC-Unique: r7eZ9nBnM8K7yv9HKzf1Rw-1
Received: by mail-ed1-f72.google.com with SMTP id
 h16-20020a0564020950b029038cbdae8cbaso2785954edz.6
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 00:08:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L4/6mIOtOdHLsx+0vZviyP3fDK7Dee4kc2xkN24Bu5w=;
 b=q89QO/GoBQp1VokM9dxZDqeIwM/RVoZVuJjAFeHUNaOmAZI68muLovgKx2ezmlelhY
 Ysj3coKQlNBB8v52ddB3p8k3TDdVvGHlRkAaDqKiglTghJxG+wV3aTZhTJ7df9WIc3fc
 xsGKROhwFq85udGQkIp8W4cqmvNuR4ZpPowACTu99ubPfTrH4e1biVfiFDoGi+wwuTK0
 1zyj8IGrF+bwYlDjwhb6U1axYVQMNHgRChJgoMX0ENLfBxb3H3V/xMyfNC7eBHOTas2q
 qwmWPdR60gJ1JNdJvV7De+y1Had+dvgcNOL+v8vWysfALk0XP7hHYLDGHZrkJ+F6v1jt
 1Ulg==
X-Gm-Message-State: AOAM531Lif2PTa81Op8lPVAYrvX9SIZlKXqGO3d67gxdSd2Cyu6LORdE
 0wQ85fKrxL1jaqlAzOuRR/T8HX2Zxp/gVyEQjAxhyRxBMrjJpkFNGcb8n2O1pakaCHzyPwO0qtY
 9N6m+2qetAbIwTdc=
X-Received: by 2002:a05:6402:524d:: with SMTP id
 t13mr42707001edd.209.1622704125130; 
 Thu, 03 Jun 2021 00:08:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPkAJdd7zI5S6mYT1FVejNcPKSl+zYNTeSWbaqowcd8+kIjcP0ZqAOvAzHeD5SkgQhVhoYGQ==
X-Received: by 2002:a05:6402:524d:: with SMTP id
 t13mr42706984edd.209.1622704124963; 
 Thu, 03 Jun 2021 00:08:44 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id am5sm1098674ejc.28.2021.06.03.00.08.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 00:08:44 -0700 (PDT)
Subject: Re: [PATCH v3 08/19] scripts/qom-fuse: apply flake8 rules
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210603003719.1321369-1-jsnow@redhat.com>
 <20210603003719.1321369-9-jsnow@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b6634965-9c4f-0176-f5d2-7b6619a60e2e@redhat.com>
Date: Thu, 3 Jun 2021 09:08:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210603003719.1321369-9-jsnow@redhat.com>
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
> flake8 still has one warning because of the sys.path hack, but that will
> be going away by the end of this patch series.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qmp/qom-fuse | 81 +++++++++++++++++++++++---------------------
>  1 file changed, 43 insertions(+), 38 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


