Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C13A730BF3E
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 14:22:47 +0100 (CET)
Received: from localhost ([::1]:46342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6vdl-0003zz-RA
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 08:22:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l6vUa-0007X6-Ho
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:13:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l6vUQ-00034G-Va
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:13:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612271584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k4HpgduECAuUnya6mCbAhqvItDIsAclqP0XzOxobsOE=;
 b=OhCuNdZQLLY/YEVrmzDaF6ohVd+/MQaWIU3LLzag0/ZPyJU81qKyZTlC2W705IBjNe1N6f
 fGApV3/+GnqqLi32GhtHANuLVBCCsE8XIHxrnqAQOOWbLeYKDLQWf2JCaca+fLsMD2YHV0
 aBuE8MJpTnrpL8F7mb7WZPt9kPw0LbQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-7dTQhUSbNaGIE-dF7Ublvg-1; Tue, 02 Feb 2021 08:13:03 -0500
X-MC-Unique: 7dTQhUSbNaGIE-dF7Ublvg-1
Received: by mail-ed1-f69.google.com with SMTP id bo11so3011212edb.0
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 05:13:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=k4HpgduECAuUnya6mCbAhqvItDIsAclqP0XzOxobsOE=;
 b=PpAM9Ofg8kHkEAtVb5hxU7LHO9dlUjwgWb2fhd/c60d9IuSv54u+vEsJizpLQnSiHd
 y28yUOUP7dSd5c+oAwo8B++rGlp38Dmd7mU+ERQt16sS5d8rjNiIkrA8Y78rshsESrhH
 rPtPbWBtthIKvzkLM324qtR101IIvqfixyVCQToFnMCQU+vELLy8OdcGVMZoSILeMUdp
 Ni6QWdYYeoLifygmO1BXCw6OnSKgXmloU2aubvE52D5xmVoEDc5puD/rsIhjFMpeLZLL
 Xls1Q+Zg+a16xDMQndpoxYcWLZbdVXsLnkoECUrD3YQTOa7vtc7Y7JrGDMRQaYGXQmgy
 CBlw==
X-Gm-Message-State: AOAM531x2WjrEMv/QlwZv8YMUxvn1l3aJL/gPP5C0O4LLOXsc7OLCrHN
 3pvIlplDZCQNi6QWMLc2Cvhi7n2ImV7uuVe7HHeIzqLBO7/n3PGejprhG7p7UqPF5w2930cxvhP
 YdVajCh7+zwTxuyA=
X-Received: by 2002:a17:906:e203:: with SMTP id
 gf3mr22420019ejb.117.1612271582013; 
 Tue, 02 Feb 2021 05:13:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz6/7RJ2pSTlUNHTxccm4f3bKckbloDTzLlDZQf7GYSRQnpkqE28Ty3VgocnS6XppQCDf1Cvg==
X-Received: by 2002:a17:906:e203:: with SMTP id
 gf3mr22419995ejb.117.1612271581854; 
 Tue, 02 Feb 2021 05:13:01 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o60sm2311453edd.50.2021.02.02.05.13.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Feb 2021 05:13:00 -0800 (PST)
Subject: Re: [PULL 10/11] trace: document how to specify multiple --trace
 patterns
To: Markus Armbruster <armbru@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>
References: <20210201154703.180022-1-stefanha@redhat.com>
 <20210201154703.180022-11-stefanha@redhat.com>
 <d5e9b59a-f7df-5a7b-55bb-cc6066b18a70@eik.bme.hu>
 <20210201161352.GH13157@merkur.fritz.box>
 <cbab5846-b5d-d256-89d7-b2bf9f7c69f@eik.bme.hu>
 <20210201165445.GI13157@merkur.fritz.box>
 <32b015e1-f182-8557-72d1-6827e4f0a09b@redhat.com>
 <81fbad73-b911-cfb6-dc9f-142ccaee678f@eik.bme.hu>
 <87v9babq13.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <0825eae1-8d2b-3901-c5d2-5f51b188c50b@redhat.com>
Date: Tue, 2 Feb 2021 14:12:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87v9babq13.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/02/21 13:41, Markus Armbruster wrote:
> Since trace_opt_parse() deletes, this always creates an empty one.
> 
>          const char *file = qemu_opt_get(opts, "file");
> 
> This is always null.
> 
>      #ifdef CONFIG_TRACE_SIMPLE
>          st_set_trace_file(file);
>          if (init_trace_on_startup) {
>              st_set_trace_file_enabled(true);
>          }
>      #elif defined CONFIG_TRACE_LOG
>          /*
>           * If both the simple and the log backends are enabled, "--trace file"
>           * only applies to the simple backend; use "-D" for the log
>           * backend. However we should only override -D if we actually have
>           * something to override it with.
>           */
>          if (file) {
>              qemu_set_log_filename(file, &error_fatal);
>          }
>      #else
>          if (file) {
>              fprintf(stderr, "error: --trace file=...: "
>                      "option not supported by the selected tracing backends\n");
>              exit(1);
>          }
>      #endif
>      }
> 
> Bug: option parameter "file" has no effect.  I suspect this was broken
> in commit 92eecfff32 "trace: remove argument from trace_init_file",
> 2020-11-11.

Indeed, and I'll fix it.

Paolo


