Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8554E595F
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 20:48:15 +0100 (CET)
Received: from localhost ([::1]:57320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX6xq-0004hM-0N
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 15:48:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1nX2F5-0001Iv-GY
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 10:45:44 -0400
Received: from [2a00:1450:4864:20::144] (port=45644
 helo=mail-lf1-x144.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1nX27u-0005G4-6D
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 10:38:20 -0400
Received: by mail-lf1-x144.google.com with SMTP id l20so3025561lfg.12
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 07:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to;
 bh=lxjxwKVE1uHYC7yyCF0JjiUo9WYCK3PX3Mlr+nK/65o=;
 b=2oTLInQJFacYBAdWV6UxtMWN5Sx8Nc9u1FCifXtroDUIYoF2GKkrH0m90NIPyzQriY
 zQ+pugPh4NQCRE+7piw6v4SmVyOaii9lv7KyE8bTkwfp9MiYN5aIcRHNPPkFcD5c6+v0
 5CcNUQBeZczQ4tDa84wEFWpghx/GKquFbwUPKLvgojy7O86Zu85X7g8CkhEw7pNjsS52
 ji7tOlcf/IfWKwqfdEdZr6KipC6lYwMYSpUM7q1ekNORyuvVkTbDhqBSpXbUu4YeQrX2
 0y8BB/mld1ISRMElweaMGA6X+RukCcpeUW+6W1jVxcvYlxigwuGXHmjQYyGlTekGRI5M
 wyiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to;
 bh=lxjxwKVE1uHYC7yyCF0JjiUo9WYCK3PX3Mlr+nK/65o=;
 b=JOcCeJAEDiUkLSKiiGgf4MZwrxvbB5uDSkIgvfrz3wdwcpS5FUJJ3SdKXi8goZS5cN
 MEjpFc2vTO2b5Qgwl9V7L0gJvfijMgdVyBoK9EXN+of6xv3sLs+f3+RZSeP24ancs9Ve
 RdsotgCTCXs8Sp6EtkSPLU0rmWD5aH/TjGiTKv+nPpFM3CUM65RgQGeS6gfDAtS7Uoh9
 nMGsQRuk21eJYErJT+ufQ/Ygbml1Id3wQgw6a9+Nz52qIk7hJ2KiDEgZzr3/uXB4eh7o
 DBpOBsf8/n2QvNn5M6nmXyrpUh//5ilfwy5P9lOeALSGX4NcuZfesiFsAhKVryZ/wsfL
 vufQ==
X-Gm-Message-State: AOAM530bAHMiDmcMhUMnPQ/XKcrNigOw5tA3ROVFFAHcLU/IsHsRo8ng
 lGgyrLw6JOzuOBZiYZeGAt/DxA==
X-Google-Smtp-Source: ABdhPJxMFlzQR5xtc5w16WYBUNWxIGbErZl67dttNVKdeiNUgoJ7HKWV65kpAnnw+E0zpRmsXf7EJg==
X-Received: by 2002:a05:6512:3056:b0:44a:5117:2b2b with SMTP id
 b22-20020a056512305600b0044a51172b2bmr132345lfb.275.1648046295960; 
 Wed, 23 Mar 2022 07:38:15 -0700 (PDT)
Received: from [192.168.0.105] ([93.175.28.51])
 by smtp.gmail.com with ESMTPSA id
 t19-20020a195f13000000b0044a49618534sm9491lfb.132.2022.03.23.07.38.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 07:38:15 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------np8wgDX73REE2FByDsoX0vWE"
Message-ID: <59ced950-3748-5b19-9fa0-f276336b06a8@openvz.org>
Date: Wed, 23 Mar 2022 17:38:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v1 7/8] migration: analyze-migration script changed
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 qemu-devel@nongnu.org
References: <20220323105400.17649-1-nikita.lapshin@openvz.org>
 <20220323105400.17649-8-nikita.lapshin@openvz.org>
 <48f06c75-de34-ade1-afa4-bcac105e4520@mail.ru>
From: Nikita Lapshin <nikita.lapshin@openvz.org>
In-Reply-To: <48f06c75-de34-ade1-afa4-bcac105e4520@mail.ru>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::144
 (failed)
Received-SPF: permerror client-ip=2a00:1450:4864:20::144;
 envelope-from=nikita.lapshin@openvz.org; helo=mail-lf1-x144.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_PERMERROR=0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 23 Mar 2022 15:46:39 -0400
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
Cc: den@openvz.org, Nikita Lapshin <nikita.lapshin@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------np8wgDX73REE2FByDsoX0vWE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/23/22 16:57, Vladimir Sementsov-Ogievskiy wrote:

> 23.03.2022 13:53, Nikita Lapshin wrote:
>> From: Nikita Lapshin<nikita.lapshin@virtuozzo.com>
>> This script is used for RAM capabilities test. But it cannot work
>> in case of no vm description in migration stream.
>> So new flag is added to allow work this script with ram-only
>> migration stream.
>> Signed-off-by: Nikita Lapshin<nikita.lapshin@openvz.org>
>> ---
>>    scripts/analyze-migration.py | 19 ++++++++++++-------
>>    1 file changed, 12 insertions(+), 7 deletions(-)
>> diff --git a/scripts/analyze-migration.py b/scripts/analyze-migration.py
>> index b82a1b0c58..80077a09bc 100755
>> --- a/scripts/analyze-migration.py
>> +++ b/scripts/analyze-migration.py
>> @@ -495,7 +495,7 @@ def __init__(self, filename):
>>            self.filename = filename
>>            self.vmsd_desc = None
>>    
>> -    def read(self, desc_only = False, dump_memory = False, write_memory = False):
>> +    def read(self, ram_only, desc_only = False, dump_memory = False, write_memory = False):
>>            # Read in the whole file
>>            file = MigrationFile(self.filename)
>>    
>> @@ -509,7 +509,8 @@ def read(self, desc_only = False, dump_memory = False, write_memory = False):
>>            if data != self.QEMU_VM_FILE_VERSION:
>>                raise Exception("Invalid version number %d" % data)
>>    
>> -        self.load_vmsd_json(file)
>> +        if not ram_only:
>> +            self.load_vmsd_json(file)
>>    
>>            # Read sections
>>            self.sections = collections.OrderedDict()
>> @@ -518,7 +519,10 @@ def read(self, desc_only = False, dump_memory = False, write_memory = False):
>>                return
>>    
>>            ramargs = {}
>> -        ramargs['page_size'] = self.vmsd_desc['page_size']
>> +        if ram_only:
>> +            ramargs['page_size'] = 4096
>> +        else:
>> +            ramargs['page_size'] = self.vmsd_desc['page_size']
>>            ramargs['dump_memory'] = dump_memory
>>            ramargs['write_memory'] = write_memory
>>            self.section_classes[('ram',0)][1] = ramargs
>> @@ -579,6 +583,7 @@ def default(self, o):
>>    parser.add_argument("-m", "--memory", help='dump RAM contents as well', action='store_true')
>>    parser.add_argument("-d", "--dump", help='what to dump ("state" or "desc")', default='state')
>>    parser.add_argument("-x", "--extract", help='extract contents into individual files', action='store_true')
>> +parser.add_argument("--ram-only", help='parse migration dump containing only RAM', action='store_true')
>>    args = parser.parse_args()
>>    
>>    jsonenc = JSONEncoder(indent=4, separators=(',', ': '))
>> @@ -586,14 +591,14 @@ def default(self, o):
>>    if args.extract:
>>        dump = MigrationDump(args.file)
> could this ram_only instead be stored into object, so that we do
> dump = MigrationDump(args.file, ram_only=args.ram_only)
> and don't update each read call?

Yes, it could, don't see any problem with this.

>>    
>> -    dump.read(desc_only = True)
>> +    dump.read(desc_only = True, ram_only = args.ram_only)
>>        print("desc.json")
>>        f = open("desc.json", "w")
>>        f.truncate()
>>        f.write(jsonenc.encode(dump.vmsd_desc))
>>        f.close()
>>    
>> -    dump.read(write_memory = True)
>> +    dump.read(write_memory = True, ram_only = args.ram_only)
>>        dict = dump.getDict()
>>        print("state.json")
>>        f = open("state.json", "w")
>> @@ -602,12 +607,12 @@ def default(self, o):
>>        f.close()
>>    elif args.dump == "state":
>>        dump = MigrationDump(args.file)
>> -    dump.read(dump_memory = args.memory)
>> +    dump.read(dump_memory = args.memory, ram_only = args.ram_only)
>>        dict = dump.getDict()
>>        print(jsonenc.encode(dict))
>>    elif args.dump == "desc":
>>        dump = MigrationDump(args.file)
>> -    dump.read(desc_only = True)
>> +    dump.read(desc_only = True, ram_only = args.ram_only)
>>        print(jsonenc.encode(dump.vmsd_desc))
>>    else:
>>        raise Exception("Please specify either -x, -d state or -d desc")
>
--------------np8wgDX73REE2FByDsoX0vWE
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>
</pre>
    <div class="moz-cite-prefix">
      <pre>On 3/23/22 16:57, Vladimir Sementsov-Ogievskiy wrote:</pre>
    </div>
    <blockquote type="cite"
      cite="mid:48f06c75-de34-ade1-afa4-bcac105e4520@mail.ru">
      <pre>23.03.2022 13:53, Nikita Lapshin wrote:
</pre>
      <blockquote type="cite">
        <pre>From: Nikita Lapshin <a class="moz-txt-link-rfc2396E" href="mailto:nikita.lapshin@virtuozzo.com">&lt;nikita.lapshin@virtuozzo.com&gt;</a>
</pre>
        <pre>
</pre>
        <pre>This script is used for RAM capabilities test. But it cannot work
</pre>
        <pre>in case of no vm description in migration stream.
</pre>
        <pre>So new flag is added to allow work this script with ram-only
</pre>
        <pre>migration stream.
</pre>
        <pre>
</pre>
        <pre>Signed-off-by: Nikita Lapshin <a class="moz-txt-link-rfc2396E" href="mailto:nikita.lapshin@openvz.org">&lt;nikita.lapshin@openvz.org&gt;</a>
</pre>
        <pre>---
</pre>
        <pre>  scripts/analyze-migration.py | 19 ++++++++++++-------
</pre>
        <pre>  1 file changed, 12 insertions(+), 7 deletions(-)
</pre>
        <pre>
</pre>
        <pre>diff --git a/scripts/analyze-migration.py b/scripts/analyze-migration.py
</pre>
        <pre>index b82a1b0c58..80077a09bc 100755
</pre>
        <pre>--- a/scripts/analyze-migration.py
</pre>
        <pre>+++ b/scripts/analyze-migration.py
</pre>
        <pre>@@ -495,7 +495,7 @@ def __init__(self, filename):
</pre>
        <pre>          self.filename = filename
</pre>
        <pre>          self.vmsd_desc = None
</pre>
        <pre>  
-    def read(self, desc_only = False, dump_memory = False, write_memory = False):
</pre>
        <pre>+    def read(self, ram_only, desc_only = False, dump_memory = False, write_memory = False):
</pre>
        <pre>          # Read in the whole file
</pre>
        <pre>          file = MigrationFile(self.filename)
</pre>
        <pre>  
@@ -509,7 +509,8 @@ def read(self, desc_only = False, dump_memory = False, write_memory = False):
</pre>
        <pre>          if data != self.QEMU_VM_FILE_VERSION:
</pre>
        <pre>              raise Exception("Invalid version number %d" % data)
</pre>
        <pre>  
-        self.load_vmsd_json(file)
</pre>
        <pre>+        if not ram_only:
</pre>
        <pre>+            self.load_vmsd_json(file)
</pre>
        <pre>  
          # Read sections
</pre>
        <pre>          self.sections = collections.OrderedDict()
</pre>
        <pre>@@ -518,7 +519,10 @@ def read(self, desc_only = False, dump_memory = False, write_memory = False):
</pre>
        <pre>              return
</pre>
        <pre>  
          ramargs = {}
</pre>
        <pre>-        ramargs['page_size'] = self.vmsd_desc['page_size']
</pre>
        <pre>+        if ram_only:
</pre>
        <pre>+            ramargs['page_size'] = 4096
</pre>
        <pre>+        else:
</pre>
        <pre>+            ramargs['page_size'] = self.vmsd_desc['page_size']
</pre>
        <pre>          ramargs['dump_memory'] = dump_memory
</pre>
        <pre>          ramargs['write_memory'] = write_memory
</pre>
        <pre>          self.section_classes[('ram',0)][1] = ramargs
</pre>
        <pre>@@ -579,6 +583,7 @@ def default(self, o):
</pre>
        <pre>  parser.add_argument("-m", "--memory", help='dump RAM contents as well', action='store_true')
</pre>
        <pre>  parser.add_argument("-d", "--dump", help='what to dump ("state" or "desc")', default='state')
</pre>
        <pre>  parser.add_argument("-x", "--extract", help='extract contents into individual files', action='store_true')
</pre>
        <pre>+parser.add_argument("--ram-only", help='parse migration dump containing only RAM', action='store_true')
</pre>
        <pre>  args = parser.parse_args()
</pre>
        <pre>  
  jsonenc = JSONEncoder(indent=4, separators=(',', ': '))
</pre>
        <pre>@@ -586,14 +591,14 @@ def default(self, o):
</pre>
        <pre>  if args.extract:
</pre>
        <pre>      dump = MigrationDump(args.file)
</pre>
      </blockquote>
      <pre>
could this ram_only instead be stored into object, so that we do
</pre>
      <pre>
dump = MigrationDump(args.file, ram_only=args.ram_only)
</pre>
      <pre>
and don't update each read call?
</pre>
      <pre>
</pre>
    </blockquote>
    <br>
    <pre>Yes, it could, don't see any problem with this.

</pre>
    <blockquote type="cite"
      cite="mid:48f06c75-de34-ade1-afa4-bcac105e4520@mail.ru">
      <blockquote type="cite">
        <pre>  
-    dump.read(desc_only = True)
</pre>
        <pre>+    dump.read(desc_only = True, ram_only = args.ram_only)
</pre>
        <pre>      print("desc.json")
</pre>
        <pre>      f = open("desc.json", "w")
</pre>
        <pre>      f.truncate()
</pre>
        <pre>      f.write(jsonenc.encode(dump.vmsd_desc))
</pre>
        <pre>      f.close()
</pre>
        <pre>  
-    dump.read(write_memory = True)
</pre>
        <pre>+    dump.read(write_memory = True, ram_only = args.ram_only)
</pre>
        <pre>      dict = dump.getDict()
</pre>
        <pre>      print("state.json")
</pre>
        <pre>      f = open("state.json", "w")
</pre>
        <pre>@@ -602,12 +607,12 @@ def default(self, o):
</pre>
        <pre>      f.close()
</pre>
        <pre>  elif args.dump == "state":
</pre>
        <pre>      dump = MigrationDump(args.file)
</pre>
        <pre>-    dump.read(dump_memory = args.memory)
</pre>
        <pre>+    dump.read(dump_memory = args.memory, ram_only = args.ram_only)
</pre>
        <pre>      dict = dump.getDict()
</pre>
        <pre>      print(jsonenc.encode(dict))
</pre>
        <pre>  elif args.dump == "desc":
</pre>
        <pre>      dump = MigrationDump(args.file)
</pre>
        <pre>-    dump.read(desc_only = True)
</pre>
        <pre>+    dump.read(desc_only = True, ram_only = args.ram_only)
</pre>
        <pre>      print(jsonenc.encode(dump.vmsd_desc))
</pre>
        <pre>  else:
</pre>
        <pre>      raise Exception("Please specify either -x, -d state or -d desc")
</pre>
      </blockquote>
      <pre>
</pre>
      <br>
    </blockquote>
  </body>
</html>

--------------np8wgDX73REE2FByDsoX0vWE--

