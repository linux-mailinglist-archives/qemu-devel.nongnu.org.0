Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 698C1473325
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 18:39:35 +0100 (CET)
Received: from localhost ([::1]:40514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwpIT-0007o4-R5
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 12:39:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mwpGp-000774-Uj
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 12:37:51 -0500
Received: from [2a00:1450:4864:20::52f] (port=41738
 helo=mail-ed1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mwpGn-0005Me-0J
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 12:37:50 -0500
Received: by mail-ed1-x52f.google.com with SMTP id g14so53788917edb.8
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 09:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2/F0v5K7E209Rwm4YIg7dhOUcKF7PirY/H+d/Sna7As=;
 b=oqpzcK5m1GvRsqTlXSL4YJUU45WZ4dsQ3Gbo9vJfp5tREomCELo0VeFGad/NvRFmyZ
 u2LXcN53GeJtbbMP5VeiTY1vjrsHvclgck56XwDWJrSV1FVi45O1ZQ2D6R8BcCNWyj8e
 3rgIFB84xY74/Rw/v8n8dPdAteyvceZrAwRF780IY8KlpRAqakNUowNY4yP+y5kshu4V
 jJfLTePFqTJUR2CCtyrYj8k3bR1yOlQNP07eyI2a80t92G99ud0PPWH9cq2Am75dzx7/
 feXaUk0mWBBYGDH7fu+QgHX0BtY5a8LqZJ7No925hLK204p69PaIsdW1Zp1gOwLbmb8a
 ZzLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2/F0v5K7E209Rwm4YIg7dhOUcKF7PirY/H+d/Sna7As=;
 b=2EIdJ2XvP1L3QqNzm/48BQGUbmUzkqed+Ecu3z6EEvI61WJLpSuxCs3Rt8ZIvyrxT5
 gHNHZ59TKWZinFJ3lSUZM6SOotJgPi5WVSsbUHqbmu6YLvsS75IFtV1AFosn7v3Ks3rK
 oD07lGUa79wBNqk0mz1vPo5tohz4al8jwyd4Drmdwa10txmVdX4FhZIxkjwDP7Z1Uj0l
 wKvbHOUdKEHoqjhTmwrPADSLEN/1TDYkmduo37Tsz8ViWxOCzArqaXtBuDK0XeXmAckN
 WYlSpsLS6le1clffY97WPONeJI8b6N56OVxtR0mnvPpnKQf3lUzNbvrFEPDAg2Vfq1Zd
 Zg8w==
X-Gm-Message-State: AOAM532+2xh9bQDHg/JINn7IOgRSM7Aby2MKo2fAIMfkNTXHnuSMuTHu
 v2gI+E0MAZGSX3ceOkB06eU=
X-Google-Smtp-Source: ABdhPJxM1ECBHCFSfoDeTk7Msq+KnjuU2iz/+4uaQxF+nAuZkCE6L4O8/Jw+5gy3Ds6z6RWv3l4MDw==
X-Received: by 2002:aa7:ce1a:: with SMTP id d26mr161138edv.189.1639417067019; 
 Mon, 13 Dec 2021 09:37:47 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id ne33sm6343334ejc.6.2021.12.13.09.37.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 09:37:46 -0800 (PST)
Message-ID: <16cd5683-4f97-d24c-dd19-24febcab7ba8@redhat.com>
Date: Mon, 13 Dec 2021 18:37:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Redesign of QEMU startup & initial configuration
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
References: <87lf13cx3x.fsf@dusky.pond.sub.org> <YbJU5vVdesoGuug9@redhat.com>
 <87mtl88t0j.fsf@dusky.pond.sub.org>
 <a31201bb-78de-e926-1476-b48b008745c1@redhat.com>
 <878rwozfqm.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <878rwozfqm.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-4.093,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Mark Burton <mark.burton@greensocs.com>, qemu-devel@nongnu.org,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/13/21 16:28, Markus Armbruster wrote:
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
>> On 12/10/21 14:54, Markus Armbruster wrote:
>>> I want an open path to a single binary.  Taking years to get there is
>>> fine.
>>
>> The single binary is a distraction in my opinion.  Imagine
>> instead of vl.c you have this in your second binary:
> 
> [...]
> 
>> static void open_socket_and_monitor(void)
>> {
>>      int nfds = check_socket_activation();
>>      Chardev *chardev;
>>      if (nfds > 1) {
>>          error_report("QEMU only supports listening on one socket");
>>          exit(1);
>>      }
>>      if (!nfds) {
>>          ChardevBackend backend = {
>>              .type = CHARDEV_BACKEND_KIND_STDIO,
>>              .u.stdio.data = &(ChardevStdio) {
>>                  .has_signal = true,
>>                  .signal = false
>>              }
>>          };
>>          chardev = qemu_chardev_new("#qmp0", TYPE_CHARDEV_STDIO, &backend, NULL, &error_fatal);
>>      } else {
>>          ChardevBackend backend = {
>>             .type = CHARDEV_BACKEND_KIND_SOCKET,
>>             .u.socket.data = &(ChardevSocket) {
>>                 .addr = &(SocketAddressLegacy) {
>>                     .type = SOCKET_ADDRESS_LEGACY_KIND_FD,
>>                     .u.fd.data = &(String){
>>                         .str = (char *) stringify(FIRST_SOCKET_ACTIVATION_FD)
>>                     }
>>                 }
>>             }
>>          };
>>          chardev = qemu_chardev_new("#qmp0", TYPE_CHARDEV_SOCKET, &backend, NULL, &error_fatal);
>>      }
>>      monitor_init_qmp(chardev, true, &error_fatal);
>> }
>>
>> void qemu_init(int argc, char **argv, char **envp)
>> {
>>      error_init(argv[0]);
>>      qemu_init_exec_dir(argv[0]);
>>      qemu_init_subsystems();
>>
>>      /* Missing: parse -name, -sandbox, -trace, -L */
>>
>>      loc_set_none();
>>      rcu_disable_atfork();
>>      qemu_init_main_loop(&error_fatal);
>>      cpu_timers_init();
>>      open_socket_and_monitor();
>>      init_displaystate();
>>      os_setup_signal_handling();
>> }
>>
>> This is the ultimate QEMU startup code.  If we can get this code to
>> actually build a machine, you've reached the point where you don't care
>> about what is in the command line parser; and consequently you don't care
>> if there is one binary or two.
> 
> Define "you".  Also explain why it should include me, because I think it
> doesn't :)

Impersonal you. :)

> By when can we have this second binary in master?  Opinion, please, not
> promise.

Define "have":

- a binary that builds

- a binary that builds a bootable guest

- a binary that builds any guest that the current well-maintained 
targets can build, using a given (but roughly full-featured) subset of 
options

Estimates for the first are easy (it's in my tree), estimates for the 
second depends on somebody helping (upstreaming -M smp took months 
between me being busy, reviewers being busy, and releases freezing 
development), estimates for the third are hard.

> Would you object to me expanding the CLI here to the point where I think
> we can deprecate the old binary?
> 
> If yes, why?

Yes, for two reasons.

First, because there will be usually differences between the command 
lines as mentioned elsewhere in the thread.  qemu-system-* is a good 
name, but one that is already taken by 15 years of docs using the 
existing command line.

Second, because a command line is really hard to get right as complexity 
increases.  QMP is the way to go to get as clean as possible a 
configuration mechanism.  There *will* be a second set of warts layered 
on top of the above code, and I don't want that.

Paolo

> If no, the file names climain.c and qmpmain.c you mentioned upthread
> won't last.  Recommend to pick better names.
> 
> 


