Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F4D2DE0B9
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 11:07:19 +0100 (CET)
Received: from localhost ([::1]:50140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqCfN-0001nm-OC
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 05:07:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kqCe3-0000vA-ST
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:05:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kqCe0-0000u1-TX
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:05:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608285951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yk73ldKhOWuFYvTVGTVu19urmqbAsmpbkCjFIwv2vFY=;
 b=f82ZjPFJJYiqmrfeam5nLlep5lwpnFoz7uBEnagoAS+MyXOA9XbUvDcaTFTFoDojGTuzsY
 cj3VjdNM1/EC0FzCVbut/tFmp+jdmU6Fc1hcNLZkMhJzzy0rca4kInCKuyIqBPaePx3OUD
 tnoX0MSWUvYd6USHXL9bt2No6yRWihg=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-j2D12OpXNdK5BT2wGqU8Kw-1; Fri, 18 Dec 2020 05:05:49 -0500
X-MC-Unique: j2D12OpXNdK5BT2wGqU8Kw-1
Received: by mail-ej1-f72.google.com with SMTP id n17so607949eja.23
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 02:05:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Yk73ldKhOWuFYvTVGTVu19urmqbAsmpbkCjFIwv2vFY=;
 b=VREXtJRxH45ojoAxbp2kACQx145SIgDAThtakaHtsbEhxrqdGkwElFbXSgemfOAg2z
 c7Xyut4MYVTBtKrBpM+OVaDmQVG7yy+e5RHhhC+QmKDaxGuEGxL+85jUsMS2SeQmbuYd
 bYHHjEThHSm2mjz2Prq2QteRKmH5oYRSQy4J+D6b2xf74qCpEco8DaG19iew0HWSKS9h
 2WHzXtNIY1h7v9Z2oCsHpkjeGfBQMlbmYvbJK/1tPMyOeaBUDluzIXgnbzNhtv5oFCCo
 uAnXMMEnQeltcqu3KRaBMaOyUcJB7xzozTkz79k8EUucoengs9Nm5ujI8xj4bxEspr/M
 6cuQ==
X-Gm-Message-State: AOAM530j0haMZKoFWS7KUeF0kngHKesEytrQ84ucGZbYNfLrkz2//qSn
 WRKWdenzNw93q0jwwkh3iDVc2coSDsJG2mBWwg/Nkj5laRbo7xTtL2Jby8/gNHf4E06Zr78K2DL
 WuS9dWAgF5AP8RYo=
X-Received: by 2002:a17:906:451:: with SMTP id
 e17mr3171783eja.228.1608285947952; 
 Fri, 18 Dec 2020 02:05:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyOCaUps7C1Blc17nM+DRtSqSrsTKZ8FQgwQt5Eq/mY+9wDFi1lqne28rTtDUudakiDb/j1Vg==
X-Received: by 2002:a17:906:451:: with SMTP id
 e17mr3171763eja.228.1608285947771; 
 Fri, 18 Dec 2020 02:05:47 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id lz17sm5251835ejb.19.2020.12.18.02.05.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Dec 2020 02:05:46 -0800 (PST)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Gustavo Romero <gromero@linux.ibm.com>
References: <20201216013646.40799-1-gromero@linux.ibm.com>
 <87bleut3si.fsf@linaro.org>
 <16b08946-9f96-200e-231f-40e24bb21734@linux.ibm.com>
 <87y2hwqpd2.fsf@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] configure: Fail when specified cross compiler cannot be
 found
Message-ID: <9d350192-db21-82ea-1246-8f70e5c89b36@redhat.com>
Date: Fri, 18 Dec 2020 11:05:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <87y2hwqpd2.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: gustavo.romero@protonmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/12/20 18:56, Alex Bennée wrote:
> To be honest at the moment the information is a little hidden at the top
> of the output. It would be nice if we could teach meson to echo it in
> it's nice coloured output.
> 
> Paolo,
> 
> Any ideas for the cleanest way to do that?

The code in configure is pretty small:

(for i in $cross_cc_vars; do
   export $i
done
export target_list source_path use_containers
$source_path/tests/tcg/configure.sh)

configure would place the cross-cc variables (which are really just 
command line options) in a file, something like config-cross-cc.mak, and 
the Meson translation of the above would be

env = environment()
foreach k, v : keyval.load(meson.current_build_dir() / 
'config-cross-cc.mak')
   env.set(k, v)
endforeach
env.set('target_list', ','.join(target_dirs))
env.set('source_path', meson.source_root())
env.set('use_containers',
         'CROSS_CC_CONTAINERS' in config_host ? 'yes' : 'no')
message(run_command(files('tests/tcg/configure.sh'), env: env).stdout())

For a bit more polish, one could make tests/tcg/configure.sh print the 
result in keyval format, parse it back from meson as a dictionary with 
keyval.load(), and pass the result to summary().

Paolo


