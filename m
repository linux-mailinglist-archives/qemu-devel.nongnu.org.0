Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1576939CA41
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 19:40:44 +0200 (CEST)
Received: from localhost ([::1]:58924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpaHr-0007YL-5R
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 13:40:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lpaFh-0006hA-4K
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 13:38:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lpaFc-000192-SX
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 13:38:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622914702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ivf6812iM8CeK9tl6ewbIOVisANVzieyQXXYg/M7g7w=;
 b=OqKQdRkqssWfEhwnzhKfIwSwdKCypQkUVIuI9xXdSyp7qOK7Z8SLZRxmFcf1Bp0WLf768Y
 Uei7Uw3EOFCs94hVLJDnPGUaWsM0VdhhJ7oE3VCmHFTpzosA5aiz6Hkm/JZ0xLfxcVs3GO
 pf1ks0GgSDQlrWKSfulbvlARi3E/wxY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-SEA1N5IXNomHPP-ZCmIayg-1; Sat, 05 Jun 2021 13:38:19 -0400
X-MC-Unique: SEA1N5IXNomHPP-ZCmIayg-1
Received: by mail-ed1-f71.google.com with SMTP id
 c21-20020a0564021015b029038c3f08ce5aso6997363edu.18
 for <qemu-devel@nongnu.org>; Sat, 05 Jun 2021 10:38:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ivf6812iM8CeK9tl6ewbIOVisANVzieyQXXYg/M7g7w=;
 b=ZYn7xt+gvmqavbS/cJASqbIlvyBnHzbhEaH36awQvuu6ngF70cCkVKGer8hmZ4hc8L
 FnoXrRQs6xEpSYKyzy8GC4LW67yTEpFzdb36z6KhUzTolfvXJeWrcFQRwC98oMBxxzlm
 xaXTTABPCVgoxKYY/4aQMHwqnCG3v26WhCSu4vKMSMUbcvPVafiZnxBJyD4U/Hl4ojxa
 7etAjz+Rp7oNs+NZjYULXV2BptMAAXuAYsWKN4ywQdT3tXRajFNWvjtCqfKf2Ie7hgGh
 sb255GeydXkECFACH2OKUlbV2bwcyiyRXjmj9ivpNrCgG92MDosPZk31kUBw6Tmcvur4
 YFNg==
X-Gm-Message-State: AOAM532j9RQk8eGpiQGTHRovATjhDZYIgfCNwXGIGMQGh2kMRugqA2B4
 eDmVDxkVcpXcMf87BoXHa1xwcBTlVkILRyskLXxdDdLtWGW/b0DnwWoGLfjb5/Co/qVB8wWE0qY
 0l1h04Ljkx4c8sRtn39ffyMEtWQVaetg2+ERZn3Qr2lNQkSqs7UzBjKHqSkWDeA0I76c=
X-Received: by 2002:a17:906:22c7:: with SMTP id
 q7mr9891434eja.547.1622914698148; 
 Sat, 05 Jun 2021 10:38:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3EBdEcNx3Ej3fTVLzJ+NrMfWWkUNdk+tWFmF5NxzOOQitRsFdVNT9FS6jepOihkeUEybuTQ==
X-Received: by 2002:a17:906:22c7:: with SMTP id
 q7mr9891412eja.547.1622914697819; 
 Sat, 05 Jun 2021 10:38:17 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 qq26sm3139691ejb.6.2021.06.05.10.38.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Jun 2021 10:38:17 -0700 (PDT)
Subject: Re: [PATCH v5 10/16] qemu-iotests: extend the check script to prepare
 supporting valgrind for python tests
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210604091723.13419-1-eesposit@redhat.com>
 <20210604091723.13419-11-eesposit@redhat.com>
 <de6439dc-c20f-f138-496f-5bc4ca5d8f97@virtuozzo.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <4fec3474-e3e0-6f7d-eec8-bef25738ef2e@redhat.com>
Date: Sat, 5 Jun 2021 19:38:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <de6439dc-c20f-f138-496f-5bc4ca5d8f97@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.59, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 05/06/2021 15:28, Vladimir Sementsov-Ogievskiy wrote:
> 04.06.2021 12:17, Emanuele Giuseppe Esposito wrote:
>> Currently, the check script only parses the option and sets the
>> VALGRIND_QEMU environmental variable to "y".
>> Add another local python variable that prepares the command line,
>> identical to the one provided in the test scripts.
>>
>> Because the python script does not know in advance the valgrind
>> PID to assign to the log file name, use the "%p" flag in valgrind
>> log file name that automatically puts the process PID at runtime.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> Reviewed-by: Max Reitz <mreitz@redhat.com>
>> ---
>>   tests/qemu-iotests/check      |  7 ++++---
>>   tests/qemu-iotests/iotests.py | 11 +++++++++++
>>   tests/qemu-iotests/testenv.py |  1 +
>>   3 files changed, 16 insertions(+), 3 deletions(-)
>>
>> diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
>> index 1dba4218c0..e6aa110715 100755
>> --- a/tests/qemu-iotests/check
>> +++ b/tests/qemu-iotests/check
>> @@ -39,6 +39,10 @@ def make_argparser() -> argparse.ArgumentParser:
>>       p.add_argument('--gdb', action='store_true',
>>                      help="start gdbserver with $GDB_OPTIONS options \
>>                           ('localhost:12345' if $GDB_OPTIONS is empty)")
>> +    p.add_argument('--valgrind', action='store_true',
>> +                    help='use valgrind, sets VALGRIND_QEMU environment '
>> +                    'variable')
>> +
>>       p.add_argument('--misalign', action='store_true',
>>                      help='misalign memory allocations')
>>       p.add_argument('--color', choices=['on', 'off', 'auto'],
>> @@ -88,9 +92,6 @@ def make_argparser() -> argparse.ArgumentParser:
>>       g_bash.add_argument('-o', dest='imgopts',
>>                           help='options to pass to qemu-img 
>> create/convert, '
>>                           'sets IMGOPTS environment variable')
>> -    g_bash.add_argument('--valgrind', action='store_true',
>> -                        help='use valgrind, sets VALGRIND_QEMU 
>> environment '
>> -                        'variable')
>>       g_sel = p.add_argument_group('test selecting options',
>>                                    'The following options specify test 
>> set '
>> diff --git a/tests/qemu-iotests/iotests.py 
>> b/tests/qemu-iotests/iotests.py
>> index c547e8c07b..3fa1bd0ab5 100644
>> --- a/tests/qemu-iotests/iotests.py
>> +++ b/tests/qemu-iotests/iotests.py
>> @@ -96,6 +96,17 @@
>>       sys.stderr.write('Please run this test via the "check" script\n')
>>       sys.exit(os.EX_USAGE)
>> +qemu_valgrind = []
>> +if os.environ.get('VALGRIND_QEMU') == "y" and \
>> +    os.environ.get('NO_VALGRIND') != "y":
> 
> Hmm, interesting, why do you need additional NO_VALGRIND variable

To maintain consistency with the bash tests, where we have:

# Valgrind bug #409141 https://bugs.kde.org/show_bug.cgi?id=409141
# Until valgrind 3.16+ is ubiquitous, we must work around a hang in
# valgrind when issuing sigkill. Disable valgrind for this invocation.
_NO_VALGRIND()
{
     NO_VALGRIND="y" "$@"
}


> 
>> +    valgrind_logfile = "--log-file=" + test_dir
>> +    # %p allows to put the valgrind process PID, since
>> +    # we don't know it a priori (subprocess.Popen is
>> +    # not yet invoked)
>> +    valgrind_logfile += "/%p.valgrind"
>> +
>> +    qemu_valgrind = ['valgrind', valgrind_logfile, 
>> '--error-exitcode=99']
>> +
>>   socket_scm_helper = os.environ.get('SOCKET_SCM_HELPER', 
>> 'socket_scm_helper')
>>   luks_default_secret_object = 'secret,id=keysec0,data=' + \
>> diff --git a/tests/qemu-iotests/testenv.py 
>> b/tests/qemu-iotests/testenv.py
>> index 8501c6caf5..8bf154376f 100644
>> --- a/tests/qemu-iotests/testenv.py
>> +++ b/tests/qemu-iotests/testenv.py
>> @@ -298,6 +298,7 @@ def print_env(self) -> None:
>>   SOCK_DIR      -- {SOCK_DIR}
>>   SOCKET_SCM_HELPER -- {SOCKET_SCM_HELPER}
>>   GDB_OPTIONS   -- {GDB_OPTIONS}
>> +VALGRIND_QEMU -- {VALGRIND_QEMU}
>>   """
>>           args = collections.defaultdict(str, self.get_env())
>>
> 
> 
> 
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> 


