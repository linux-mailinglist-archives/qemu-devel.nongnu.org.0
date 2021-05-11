Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4FA37A986
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 16:37:12 +0200 (CEST)
Received: from localhost ([::1]:45788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgTVX-00053w-BL
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 10:37:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lgTRz-0000kC-56
 for qemu-devel@nongnu.org; Tue, 11 May 2021 10:33:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lgTRx-00070Z-HF
 for qemu-devel@nongnu.org; Tue, 11 May 2021 10:33:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620743609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=syawARIA69dDM9hTqkcDeQLaPH54MR8KpZs2rTjb4kg=;
 b=CegclDq+ygoxACTfodXiWqOGb7IxUjs88SRckeKW/BPPhPhWEf9fMqQTtiPB+1A8m3MRYI
 G9s1ESyf00wSCQ+bagYKQLBEtOXPllm+lrY6Dp58aNf5oPaT9iqmc7L5zcvrfCkJS9/F9v
 P4EkJ2A9vg0dFHAAmqcXGOgpi6foJNM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-Q4rimoV-P_mioH_jzgVhKg-1; Tue, 11 May 2021 10:33:27 -0400
X-MC-Unique: Q4rimoV-P_mioH_jzgVhKg-1
Received: by mail-wr1-f69.google.com with SMTP id
 r12-20020adfc10c0000b029010d83323601so8798368wre.22
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 07:33:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=syawARIA69dDM9hTqkcDeQLaPH54MR8KpZs2rTjb4kg=;
 b=Zw0ljQLpp2aiXqWEYHx1g3Ah2W8dqV+xTXmCVO5EF96bTzo42tyj0q7cK846WyDAXN
 jl17qkhLmlh99VDF38Ybgjbbsu6NR7p58CEEOjvL7CyYZBfmbe715zud5A8gZIBeD8R3
 jZ+uiADQuduC8E/YjIf8mxMC9FL8sj8E2EaOdMhAAumSepaoqyAx73XUGjRUhVN/deGs
 ojsKvn8vmsypgsOzZU1VwBTKYQl5Za/DBGapBfY0Bx6BgcX7eJzmbLE7yzbDUJgiswXQ
 fBeUAT9+tTzHyfnsh/tACj2viRZfeEWcOe0N6emEBmumA7+rdrmj4S6GDknjC2z4k+UG
 RA5w==
X-Gm-Message-State: AOAM533qH/l/ZWY6bx9i/mzDOjKcXttNJUAyDCVnqblpKVa6aCPLafqk
 8H6tb3Nr0OIp2O5GMDy02Hhgv6+ZRZ4MwjbQENfKM9TEJcsnC9CSkwfONlOr/nnUJTHsvJq+td9
 iZd/lxr2wF0e7+mA=
X-Received: by 2002:a05:600c:41d4:: with SMTP id
 t20mr5984844wmh.46.1620743606248; 
 Tue, 11 May 2021 07:33:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdVtQUqJ/VPsqi6cyJIcWOClpsDGN2yS9dMX3lhVmoeTIkSKc1g4l+chJ1Y7uA3+e0AdkCzw==
X-Received: by 2002:a05:600c:41d4:: with SMTP id
 t20mr5984819wmh.46.1620743606050; 
 Tue, 11 May 2021 07:33:26 -0700 (PDT)
Received: from thuth.remote.csb (pd9e835ac.dip0.t-ipconnect.de.
 [217.232.53.172])
 by smtp.gmail.com with ESMTPSA id n123sm3723433wme.24.2021.05.11.07.33.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 07:33:25 -0700 (PDT)
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210511132641.1022161-1-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 00/12] Wave goodbye to RHEL 7 vintage distros
Message-ID: <b3b927c8-9988-afe8-5d17-f0f619cca5d6@redhat.com>
Date: Tue, 11 May 2021 16:33:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210511132641.1022161-1-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/05/2021 15.26, Daniel P. Berrangé wrote:
> The main motivation for this series is to eliminate some backcompat
> logic in the crypto code only needed for RHEL-7. I take the opportunity
> to also bump the min required versions of glib, gcc and clang since we
> have dropped many distros since they were last bumped.
> 
> There are possibly some more cleanups that can be done as a side effect
> of these new min versions, but I leave that for other interested people
> to look at.
> 
> One that might be intesting is switching from std=gnu99 to gnu11 since
> we're no longer constrainted by the 4.8.x vintage GCC which marked gnu11
> as experimental (see 7be41675f7cb16be7c8d2554add7a63fa43781a8)

If you've got some spare minutes, could you please add a patch to bump the 
minimum version of libssh to 0.8.1 at least? ... since Ubuntu 18.04 ships 
with this utterly broken libssh 0.8.0 that is a Frankenstein-monster 0.7 
under the hood which we do not support in QEMU ...

  Thomas


